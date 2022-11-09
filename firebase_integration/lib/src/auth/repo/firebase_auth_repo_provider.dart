import 'package:firebase_integration/src/auth/model/firebase_auth_body.dart';
import 'package:firebase_integration/src/auth/model/firebase_user_response.dart';

abstract class IFirebaseAuth {
  Future<FirebaseUserResponse?> currentUser();
  Future<FirebaseUserResponse> login(FirebaseAuthBody authBody);
  Future<FirebaseUserResponse> register(FirebaseAuthBody authBody);
  Future<bool> verifyEmail(String email);
  Future<void> logout();
}
