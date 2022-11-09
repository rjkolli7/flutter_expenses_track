class FirebaseUserData {
  String? email;
  String? mobile;
  String? gender;
  String? dob;
  String? firstName;
  String? lastName;
  String? uid;
  String? countryName;

  FirebaseUserData({
    this.email,
    this.mobile,
    this.gender,
    this.dob,
    this.firstName,
    this.lastName,
    this.uid,
    this.countryName,
  });

  factory FirebaseUserData.fromMap(dynamic map) {
    return FirebaseUserData(
      firstName: map['fName'],
      lastName: map['lName'],
      email: map['email'],
      dob: map['dob'],
      gender: map['gender'],
      mobile: map['mobile'],
      uid: map['uid'],
      countryName: map['countryName'],
    );
  }
}
