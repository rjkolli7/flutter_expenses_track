import 'package:firebase_integration/src/database/countries/model/country_response.dart';

abstract class IFrdCountriesRepo {
  Future<CountryResponse> getCountries();
}
