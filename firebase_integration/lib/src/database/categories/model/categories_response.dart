import 'package:firebase_integration/src/database/categories/model/categories.dart';

class CategoriesResponse {
  final List<Categories>? categoriesList;
  String? error;
  CategoriesResponse({this.categoriesList, this.error});

  factory CategoriesResponse.fromMap(dynamic map) {
    List<Categories> categories = [];
    if (map != null) {
      map.forEach((element) {
        categories.add(Categories.fromMap(element));
      });
    }
    return CategoriesResponse(categoriesList: categories);
  }
}
