import 'package:firebase_integration/firebase_integration.dart';

abstract class IFrdIncomesRepo {
  Future<String> addIncome(IncomeBody body);
  Future<String> updateIncome(IncomeBody body);
  Future<IncomesResponse> getIncomes();
}
