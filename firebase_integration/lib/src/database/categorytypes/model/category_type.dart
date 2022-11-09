class CategoryType {
  String? type;
  int? id;

  CategoryType({this.type, this.id});

  factory CategoryType.fromMap(dynamic map) {
    return CategoryType(
      type: map['type'],
      id: map['id'],
    );
  }
}
