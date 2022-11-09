import 'package:firebase_integration/src/auth/model/firebase_user_data.dart';

class FirebaseUserResponse {
  String error;
  FirebaseUserData? user;

  FirebaseUserResponse({this.error = '', this.user});
}
