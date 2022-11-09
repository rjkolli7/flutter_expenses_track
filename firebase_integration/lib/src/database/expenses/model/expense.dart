class Expense {
  int? id;
  String? categoryType;
  String? category;
  dynamic amount;
  String? countryName;
  String? currencySymbol;
  String? remark;
  String? date;
  int? timeStamp;

  Expense(
      {this.id,
      this.categoryType,
      this.category,
      this.amount,
      this.countryName,
      this.currencySymbol,
      this.remark,
      this.date,
      this.timeStamp});

  factory Expense.fromMap(dynamic map) {
    return Expense(
      id: map['id'],
      categoryType: map['categoryType'],
      category: map['category'],
      amount: map['amount'],
      remark: map['remark'],
      date: map['date'],
      timeStamp: map['timeStamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryType': categoryType,
      'category': category,
      'amount': amount,
      'remark': remark,
      'date': date,
      'timeStamp': timeStamp,
    };
  }
}
