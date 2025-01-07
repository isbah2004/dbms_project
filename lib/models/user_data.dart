class UserData {
  String fullName;
  String whatsAppNo;
  String password;
  String dateOfBirth;
  String location;
  String gender;
  String profileImage;

  String id;
  String lastLogin;
  String createdAt;

  UserData({
   required this.id,
    required this.fullName,
    required this.whatsAppNo,
    required this.password,
    required this.dateOfBirth,
    required this.location,
    required this.gender,
    required this.profileImage,

    required this.lastLogin,
    required this.createdAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      fullName: json['fullname'],
      whatsAppNo: json['whatsappno'],
      password: json['hashpassward'],
      dateOfBirth: json['dateofbirth'],
      location: json['location'],
      gender: json['gender'],
      profileImage: json['profileimage'],

      lastLogin: json['lastlogin'],
      createdAt: json['createdat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullName,
      'whatsappno': whatsAppNo,
      'hashpassward': password,
      'dateofbirth': dateOfBirth,
      'location': location,
      'gender': gender,
      'profileimage': profileImage,

      'lastlogin': lastLogin,
      'createdat': createdAt,
    };
  }
}