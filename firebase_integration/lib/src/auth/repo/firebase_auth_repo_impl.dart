import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/src/auth/model/firebase_auth_body.dart';
import 'package:firebase_integration/src/auth/model/firebase_user_data.dart';
import 'package:firebase_integration/src/auth/model/firebase_user_response.dart';
import 'package:firebase_integration/src/auth/repo/firebase_auth_repo_provider.dart';

class FirebaseAuthRepo extends IFirebaseAuth {
  @override
  Future<FirebaseUserResponse> login(FirebaseAuthBody authBody) async {
    try {
      UserCredential userCredentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authBody.email ?? '',
        password: authBody.password ?? '',
      );
      User? user = userCredentials.user;
      return Future.value(
        FirebaseUserResponse(
          error: '',
          user: FirebaseUserData(
            email: user?.email,
            uid: user?.uid,
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      return Future.error(
          FirebaseUserResponse(error: error.message ?? 'unable to login'));
    }
  }

  @override
  Future<FirebaseUserResponse> register(FirebaseAuthBody authBody) async {
    try {
      bool isExist = await verifyEmail(authBody.email ?? '')
          .then((value) => value)
          .catchError((onError) => onError);
      if (!isExist) {
        UserCredential userCredentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: authBody.email ?? '',
          password: authBody.password ?? '',
        );
        User? user = userCredentials.user;
        if (user != null) {
          final databaseRef = FirebaseDatabase.instance.ref('users');
          databaseRef.child(user.uid).set(<String, dynamic>{
            "fName": authBody.firstName,
            "lName": authBody.lastName,
            "email": authBody.email,
            "mobile": authBody.mobile,
            "gender": authBody.gender,
            "dob": authBody.dob,
            "countryName": authBody.countryName,
            "uid": user.uid,
          });
          return Future.value(
            FirebaseUserResponse(
              user: FirebaseUserData(
                email: user.email,
                uid: user.uid,
                dob: authBody.dob,
                gender: authBody.gender,
                mobile: authBody.mobile,
                lastName: authBody.lastName,
                firstName: authBody.firstName,
              ),
            ),
          );
        } else {
          return Future.error(
              FirebaseUserResponse(error: 'Unable to register'));
        }
      } else {
        return Future.error(FirebaseUserResponse(
            error: 'This email is already registered with us'));
      }
    } on FirebaseAuthException catch (error) {
      return Future.error(
          FirebaseUserResponse(error: error.message ?? ': Unable to register'));
    }
  }

  @override
  Future<bool> verifyEmail(String email) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        return Future.value(true);
      } else {
        return Future.error(false);
      }
    } on FirebaseAuthException catch (error) {
      return Future.error(false);
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<FirebaseUserResponse?> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseUserResponse? userResponse;
    if (user != null) {
      FirebaseUserData userData =
          FirebaseUserData(uid: user.uid, email: user.email);
      userResponse = FirebaseUserResponse(user: userData);
    }
    return userResponse;
  }
}
