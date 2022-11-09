class ExpenseIncomeData {
  String? categoryType;
  String? category;
  dynamic amount;
  String? currencySymbol;
  String? remark;
  String? date;
  int? timeStamp;
  int? countryId;

  ExpenseIncomeData({
    this.categoryType,
    this.category,
    this.amount,
    this.countryId,
    this.remark,
    this.currencySymbol,
    this.date,
    this.timeStamp,
  });

  factory ExpenseIncomeData.fromMap(dynamic map) {
    return ExpenseIncomeData(
      categoryType: map['categoryType'],
      category: map['category'],
      amount: map['amount'],
      countryId: map['countryId'],
      remark: map['remark'],
      date: map['date'],
      timeStamp: map['timeStamp'],
      currencySymbol: map['currencySymbol'],
    );
  }
}
