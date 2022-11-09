import 'package:firebase_integration/src/database/categorytypes/model/category_type.dart';

class CategoryTypeResponse {
  final List<CategoryType>? categoryTypesList;
  String? error;
  CategoryTypeResponse({this.categoryTypesList, this.error});

  factory CategoryTypeResponse.fromMap(dynamic map) {
    List<CategoryType> categories = [];
    if (map != null) {
      map.forEach((element) {
        categories.add(CategoryType.fromMap(element));
      });
    }
    return CategoryTypeResponse(categoryTypesList: categories);
  }
}
