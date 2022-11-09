import 'package:firebase_integration/src/database/incomes/model/income.dart';

class IncomesResponse {
  final List<Income>? incomesList;
  String? error;
  IncomesResponse({this.incomesList, this.error});

  factory IncomesResponse.fromMap(dynamic map) {
    List<Income> incomes = [];
    if (map != null) {
      map.forEach((element) {
        incomes.add(Income.fromMap(element));
      });
    }
    return IncomesResponse(incomesList: incomes);
  }
}
