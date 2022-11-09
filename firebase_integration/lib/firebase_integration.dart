library firebase_integration;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_integration/src/commons/firebase_options.dart';

export 'package:firebase_integration/firebase_integration.dart';

export 'src/auth/model/firebase_auth_body.dart';
export 'src/auth/model/firebase_user_data.dart';
export 'src/auth/model/firebase_user_response.dart';
export 'src/auth/repo/firebase_auth_repo_impl.dart';
export 'src/auth/repo/firebase_auth_repo_provider.dart';
export 'src/database/categories/model/categories.dart';
export 'src/database/categories/model/categories_response.dart';
// categories
export 'src/database/categories/repo/frd_categories_repo_impl.dart';
export 'src/database/categories/repo/frd_categories_repo_provider.dart';
export 'src/database/categorytypes/model/category_type.dart';
export 'src/database/categorytypes/model/category_type_response.dart';
// category types
export 'src/database/categorytypes/repo/frd_category_types_repo_impl.dart';
export 'src/database/categorytypes/repo/frd_category_types_repo_provider.dart';
export 'src/database/countries/model/country.dart';
export 'src/database/countries/model/country_response.dart';
// countries
export 'src/database/countries/repo/frd_countries_repo_impl.dart';
export 'src/database/countries/repo/frd_countries_repo_provider.dart';
// expenses
export 'src/database/expenses/model/expense.dart';
export 'src/database/expenses/model/expense_body.dart';
export 'src/database/expenses/model/expenses_response.dart';
export 'src/database/expenses/repo/frd_expenses_repo_impl.dart';
export 'src/database/expenses/repo/frd_expenses_repo_provider.dart';
// incomes
export 'src/database/incomes/model/income.dart';
export 'src/database/incomes/model/income_body.dart';
export 'src/database/incomes/model/incomes_response.dart';
export 'src/database/incomes/repo/frd_incomes_repo_impl.dart';
export 'src/database/incomes/repo/frd_incomes_repo_provider.dart';
// users
export 'src/database/users/repo/frd_users_repo_impl.dart';
export 'src/database/users/repo/frd_users_repo_provider.dart';
export 'src/firebase_integration_base.dart';

class ExpensesTrackFirebase {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return app;
  }
}
