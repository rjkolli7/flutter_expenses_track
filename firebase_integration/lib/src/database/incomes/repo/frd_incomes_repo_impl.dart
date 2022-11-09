import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:firebase_integration/src/commons/database_extensions.dart';

class FrdIncomesRepoImpl extends IFrdIncomesRepo {
  @override
  Future<String> addIncome(IncomeBody body) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DatabaseReference databaseRef =
            connectDatabaseRef('$tbIncomes/${user.uid}');
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
          "countryName": body.countryName,
        });
        return Future.value('success');
      } on FirebaseException catch (error) {
        return Future.error(error.message ?? 'Adding Income Failed');
      }
    }
    return Future.error('Adding Income Failed');
  }

  @override
  Future<String> updateIncome(IncomeBody body) async {
    try {
      DatabaseReference databaseRef =
          connectDatabaseRef('$tbIncomes/${body.uid}/${body.id}');
      await setDataToFirebaseDatabase(
          '${body.id}', databaseRef, <String, dynamic>{
        "amount": body.amount,
        "category": body.category,
        "date": body.date,
        "remark": body.remark,
        "timeStamp": body.timeStamp,
        "countryName": body.countryName,
      });
      return Future.value('success');
    } on FirebaseException catch (error) {
      return Future.error(error.message ?? 'Adding Income Failed');
    }
  }

  @override
  Future<IncomesResponse> getIncomes() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final databaseRef =
            FirebaseDatabase.instance.ref('$tbIncomes/${user.uid}');
        DataSnapshot data = await databaseRef.get();
        return Future.value(IncomesResponse.fromMap(data.value));
      }
    } on FirebaseException catch (error) {
      return Future.error(
          IncomesResponse(error: error.message ?? 'Fetching Incomes Failed'));
    } catch (error) {
      return Future.error(IncomesResponse(error: 'Fetching Incomes Failed'));
    }
    return Future.error(IncomesResponse(error: 'Fetching Incomes Failed'));
  }
}
