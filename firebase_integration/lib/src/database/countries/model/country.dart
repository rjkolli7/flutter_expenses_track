class Country {
  String? code;
  String? currency;
  String? iso1;
  String? iso2;
  String? name;
  String? symbol;
  int? phoneLength;
  int? minPhoneLength;

  Country({
    this.code,
    this.currency,
    this.iso1,
    this.iso2,
    this.name,
    this.symbol,
    this.phoneLength,
    this.minPhoneLength,
  });

  factory Country.fromMap(dynamic map) {
    return Country(
      code: map['code'],
      currency: map['currency'],
      iso1: map['iso1'],
      iso2: map['iso2'],
      name: map['name'],
      symbol: map['symbol'],
      phoneLength: map['length'],
      minPhoneLength: map['minLength'],
    );
  }
}
