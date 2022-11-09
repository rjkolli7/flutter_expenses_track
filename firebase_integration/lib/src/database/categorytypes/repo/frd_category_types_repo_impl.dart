import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/src/commons/database_extensions.dart';
import 'package:firebase_integration/src/database/categorytypes/model/category_type_response.dart';

import 'frd_category_types_repo_provider.dart';

class FrdCategoryTypesRepoImpl extends IFrdCategoryTypesRepo {
  @override
  Future<CategoryTypeResponse> getCategoryTypes() async {
    DatabaseReference userDatabaseRef = connectDatabaseRef(tbCategoryTypes);
    FirebaseDatabaseData data =
        await getDataFromFirebaseDatabase(userDatabaseRef);
    if (data.snapshot != null) {
      return Future.value(CategoryTypeResponse.fromMap(data.snapshot!.value));
    } else if (data.errorMessage != null) {
      return Future.error(CategoryTypeResponse(
          error: data.errorMessage ?? ' Unable to get Category Types'));
    }
    return Future.error(
        CategoryTypeResponse(error: 'Unable to get Category Types'));
  }
}
