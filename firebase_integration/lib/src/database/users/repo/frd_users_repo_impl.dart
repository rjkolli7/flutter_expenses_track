import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/src/auth/model/firebase_auth_body.dart';
import 'package:firebase_integration/src/auth/model/firebase_user_data.dart';
import 'package:firebase_integration/src/auth/model/firebase_user_response.dart';
import 'package:firebase_integration/src/commons/database_extensions.dart';
import 'package:firebase_integration/src/database/users/repo/frd_users_repo_provider.dart';

class FrdUsersRepo extends IFrdUsers {
  @override
  Future<FirebaseUserResponse> getUser(String uid) async {
    DatabaseReference userDatabaseRef = connectDatabaseRef('$tbUsers/$uid');
    FirebaseDatabaseData data =
        await getDataFromFirebaseDatabase(userDatabaseRef);
    if (data.snapshot != null) {
      return Future.value(FirebaseUserResponse(
          user: FirebaseUserData.fromMap(data.snapshot!.value)));
    } else if (data.errorMessage != null) {
      return Future.error(FirebaseUserResponse(
          error: data.errorMessage ?? ' Unable to get user profile data'));
    }
    return Future.error(
        FirebaseUserResponse(error: 'Unable to get user profile data'));
  }

  @override
  Future<FirebaseUserResponse> setUser(FirebaseAuthBody authBody) async {
    DatabaseReference databaseRef = connectDatabaseRef(tbUsers);
    if (authBody.uid != null) {
      FirebaseDatabaseData data = await setDataToFirebaseDatabase(
          authBody.uid!, databaseRef, <String, dynamic>{
        "fName": authBody.firstName,
        "lName": authBody.lastName,
        "email": authBody.email,
        "mobile": authBody.mobile,
        "gender": authBody.gender,
        "dob": authBody.dob,
        "uid": authBody.uid,
        "countryName": authBody.countryName,
      });

      if (data.errorMessage != null) {
        return Future.error(data.errorMessage ?? ' Unable to register user');
      }
      return Future.value(
        FirebaseUserResponse(
          user: FirebaseUserData(
            email: authBody.email,
            uid: authBody.uid,
          ),
        ),
      );
    }

    return Future.error('Unable to register user, missing uid');
  }

  @override
  Future<FirebaseUserResponse> updateUser(FirebaseAuthBody authBody) async {
    DatabaseReference databaseRef = connectDatabaseRef(tbUsers);
    if (authBody.uid != null) {
      FirebaseDatabaseData data = await setDataToFirebaseDatabase(
          authBody.uid!, databaseRef, <String, dynamic>{
        "email": authBody.email,
        "fName": authBody.firstName,
        "lName": authBody.lastName,
        "mobile": authBody.mobile,
        "gender": authBody.gender,
        "dob": authBody.dob,
        "countryName": authBody.countryName,
      });

      if (data.errorMessage != null) {
        return Future.error(data.errorMessage ?? ' Unable to register user');
      }
      return Future.value(
        FirebaseUserResponse(
          user: FirebaseUserData(
            email: authBody.email,
            uid: authBody.uid,
          ),
        ),
      );
    }

    return Future.error('Unable to register user, missing uid');
  }
}
