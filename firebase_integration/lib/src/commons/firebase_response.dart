class FirebaseResponse<T> {
  String error;
  T? data;

  FirebaseResponse({this.error = '', this.data});
}