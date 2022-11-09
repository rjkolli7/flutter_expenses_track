import 'package:firebase_integration/src/database/categorytypes/model/category_type_response.dart';

abstract class IFrdCategoryTypesRepo {
  Future<CategoryTypeResponse> getCategoryTypes();
}
