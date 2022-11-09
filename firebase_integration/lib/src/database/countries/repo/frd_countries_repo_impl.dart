import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/src/commons/database_extensions.dart';
import 'package:firebase_integration/src/database/countries/model/country_response.dart';

import 'frd_countries_repo_provider.dart';

class FrdCountriesRepoImpl extends IFrdCountriesRepo {
  @override
  Future<CountryResponse> getCountries() async {
    DatabaseReference userDatabaseRef = connectDatabaseRef(tbCountries);
    FirebaseDatabaseData data =
        await getDataFromFirebaseDatabase(userDatabaseRef);
    if (data.snapshot != null) {
      return Future.value(CountryResponse.fromMap(data.snapshot!.value));
    } else if (data.errorMessage != null) {
      return Future.error(CountryResponse(
          error: data.errorMessage ?? ' Unable to get Countries'));
    }
    return Future.error(CountryResponse(error: 'Unable to get Countries'));
  }
}
