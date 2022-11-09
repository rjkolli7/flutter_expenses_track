import 'package:firebase_database/firebase_database.dart';

const String tbUsers = "users";
const String tbCategories = "categories";
const String tbCategoryTypes = "categorieTypes";
const String tbCountries = "countries";
const String tbExpenses = "expenses";
const String tbIncomes = "incomes";

DatabaseReference connectDatabaseRef(String path) =>
    FirebaseDatabase.instance.ref(path);

Future<FirebaseDatabaseData> getDataFromFirebaseDatabase(
        DatabaseReference databaseRef) =>
    databaseRef
        .get()
        .then((value) => FirebaseDatabaseData(snapshot: value))
        .catchError((onError) => FirebaseDatabaseData(errorMessage: onError));

Future<FirebaseDatabaseData> setDataToFirebaseDatabase(
        String path, DatabaseReference databaseRef, dynamic data) =>
    databaseRef
        .child(path)
        .set(data)
        .then((value) => FirebaseDatabaseData())
        .catchError((onError) =>
            FirebaseDatabaseData(errorMessage: onError.toString()));

class FirebaseDatabaseData {
  DataSnapshot? snapshot;
  String? errorMessage;

  FirebaseDatabaseData({this.snapshot, this.errorMessage});
}
