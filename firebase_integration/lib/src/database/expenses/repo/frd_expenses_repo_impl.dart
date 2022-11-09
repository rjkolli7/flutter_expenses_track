import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:firebase_integration/src/commons/database_extensions.dart';

class FrdExpensesRepoImpl extends IFrdExpensesRepo {
  @override
  Future<String> addExpenses(ExpenseBody body) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DatabaseReference databaseRef =
            connectDatabaseRef('$tbExpenses/${user.uid}');
        FirebaseDatabaseData? data;
        try {
          data = await getDataFromFirebaseDatabase(databaseRef);
        } on FirebaseException catch (error) {}
        var index = data?.snapshot?.children == null
            ? 0
            : data?.snapshot?.children.length;
        await setDataToFirebaseDatabase(
            '$index', databaseRef, <String, dynamic>{
          "uid": user.uid,
          "id": index,
          "amount": body.amount,
          "category": body.category,
          "categoryType": body.categoryType,
          "date": body.date,
          "remark": body.remark,
          "timeStamp": body.timeStamp,
          "countryId": body.countryId,
        });
        return Future.value('success');
      } on FirebaseException catch (error) {
        return Future.error(error.message ?? 'Adding Expenses Failed');
      }
    }
    return Future.error('Adding Expenses Failed');
  }

  @override
  Future<String> updateExpenses(ExpenseBody body) async {
    try {
      DatabaseReference databaseRef =
          connectDatabaseRef('$tbExpenses/${body.uid}/${body.id}');
      await setDataToFirebaseDatabase(
          '${body.id}', databaseRef, <String, dynamic>{
        "amount": body.amount,
        "category": body.category,
        "date": body.date,
        "remark": body.remark,
        "timeStamp": body.timeStamp,
        "countryId": body.countryId,
      });
      return Future.value('success');
    } on FirebaseException catch (error) {
      return Future.error(error.message ?? 'Adding Income Failed');
    }
  }

  @override
  Future<ExpensesResponse> getExpenses() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final databaseRef =
            FirebaseDatabase.instance.ref('$tbExpenses/${user.uid}');
        DataSnapshot data = await databaseRef.get();
        return Future.value(ExpensesResponse.fromMap(data.value));
      }
    } on FirebaseException catch (error) {
      return Future.error(
          ExpensesResponse(error: error.message ?? 'Fetching Expenses Failed'));
    }
    return Future.error(ExpensesResponse(error: 'Fetching Expenses Failed'));
  }
}
