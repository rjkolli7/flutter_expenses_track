class Categories {
  String? type;
  String? name;
  bool? isOpen;
  int? id;
  int? typeId;

  Categories({this.type, this.name, this.isOpen, this.id, this.typeId});

  factory Categories.fromMap(dynamic map) {
    return Categories(
      type: map['type'],
      id: map['id'],
      typeId: map['typeId'],
      isOpen: map['isOpen'],
      name: map['name'],
    );
  }
}
