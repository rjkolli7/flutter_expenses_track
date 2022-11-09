import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/src/commons/database_extensions.dart';
import 'package:firebase_integration/src/database/categories/model/categories_response.dart';

import 'frd_categories_repo_provider.dart';

class FrdCategoriesRepoImpl extends IFrdCategoriesRepo {
  @override
  Future<CategoriesResponse> getCategories() async {
    DatabaseReference userDatabaseRef = connectDatabaseRef(tbCategories);
    FirebaseDatabaseData data =
        await getDataFromFirebaseDatabase(userDatabaseRef);
    if (data.snapshot != null) {
      return Future.value(CategoriesResponse.fromMap(data.snapshot!.value));
    } else if (data.errorMessage != null) {
      return Future.error(CategoriesResponse(
          error: data.errorMessage ?? ' Unable to get Categories'));
    }
    return Future.error(CategoriesResponse(error: 'Unable to get Categories'));
  }
}
