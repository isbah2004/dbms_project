class EditProfile {
  final String id;
  final String fullName;
  final String dateOfBirth;
  final String location;
  final String gender;
  final String profileImage;

  EditProfile({
    required this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.location,
    required this.gender,
    required this.profileImage,
  });

  factory EditProfile.fromJson(Map<String, dynamic> json) {
    return EditProfile(
      id: json['id'],
      fullName: json['fullName'],
      dateOfBirth: json['dateOfBirth'],
      location: json['location'],
      gender: json['gender'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'location': location,
      'gender': gender,
      'profileImage': profileImage,
    };
  }
}