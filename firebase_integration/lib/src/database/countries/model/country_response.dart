import 'package:firebase_integration/src/database/countries/model/country.dart';

class CountryResponse {
  final List<Country>? countries;
  String? error;
  CountryResponse({this.countries, this.error});

  factory CountryResponse.fromMap(dynamic map) {
    List<Country> countries = [];
    if (map != null) {
      map.forEach((element) {
        countries.add(Country.fromMap(element));
      });
    }
    return CountryResponse(countries: countries);
  }
}
