import 'package:firebase_integration/src/auth/model/firebase_auth_body.dart';
import 'package:firebase_integration/src/auth/model/firebase_user_response.dart';

abstract class IFrdUsers {
  Future<FirebaseUserResponse> getUser(String uid);
  Future<FirebaseUserResponse> setUser(FirebaseAuthBody authBody);
  Future<FirebaseUserResponse> updateUser(FirebaseAuthBody authBody);
}
