class SignupModel {
  final String fullName;
  final String whatsAppNo;
  final String password;
  final String dateOfBirth;
  final String location;
  final String gender;
  final String profileImage;

  SignupModel({
    required this.fullName,
    required this.whatsAppNo,
    required this.password,
    required this.dateOfBirth,
    required this.location,
    required this.gender,
    required this.profileImage,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      fullName: json['fullName'],
      whatsAppNo: json['whatsAppNo'],
      password: json['password'],
      dateOfBirth: json['dateOfBirth'],
      location: json['location'],
      gender: json['gender'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'whatsAppNo': whatsAppNo,
      'password': password,
      'dateOfBirth': dateOfBirth,
      'location': location,
      'gender': gender,
      'profileImage': profileImage,
    };
  }
}
