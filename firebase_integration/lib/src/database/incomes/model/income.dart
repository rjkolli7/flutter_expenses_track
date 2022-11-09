class Income {
  int? id;
  String? categoryType;
  String? category;
  dynamic amount;
  String? countryName;
  String? currencySymbol;
  String? remark;
  String? date;
  int? timeStamp;

  Income(
      {this.id,
      this.categoryType,
      this.category,
      this.amount,
      this.countryName,
      this.currencySymbol,
      this.remark,
      this.date,
      this.timeStamp});

  factory Income.fromMap(dynamic map) {
    return Income(
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
