class UserProfile {
  final String id;
  final String whatsappNo;
  final String hashPassword;
  final String fullName;
  final DateTime dateOfBirth;
  final String location;
  final String gender;
  final DateTime lastLogin;
  final String profileImage;
  final DateTime createdAt;

  UserProfile({
    required this.id,
    required this.whatsappNo,
    required this.hashPassword,
    required this.fullName,
    required this.dateOfBirth,
    required this.location,
    required this.gender,
    required this.lastLogin,
    required this.profileImage,
    required this.createdAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      whatsappNo: json['whatsappno'],
      hashPassword: json['hashpassward'],
      fullName: json['fullname'],
      dateOfBirth: DateTime.parse(json['dateofbirth']),
      location: json['location'],
      gender: json['gender'],
      lastLogin: DateTime.parse(json['lastlogin']),
      profileImage: json['profileimage'],
      createdAt: DateTime.parse(json['createdat']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'whatsappno': whatsappNo,
      'hashpassward': hashPassword,
      'fullname': fullName,
      'dateofbirth': dateOfBirth.toIso8601String(),
      'location': location,
      'gender': gender,
      'lastlogin': lastLogin.toIso8601String(),
      'profileimage': profileImage,
      'createdat': createdAt.toIso8601String(),
    };
  }
}