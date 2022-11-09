import 'package:firebase_integration/src/database/categories/model/categories_response.dart';

abstract class IFrdCategoriesRepo {
  Future<CategoriesResponse> getCategories();
}
