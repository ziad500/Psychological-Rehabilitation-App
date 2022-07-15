class ProfileModel {
  ProfileModel({
    required this.user,
  });
  late final User user;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
  }
}

class User {
  User({
    required this.languages,
    required this.emailVerified,
    required this.id,
    required this.image,
    required this.name,
    required this.mobilePhone,
    required this.gender,
    required this.email,
    required this.birthDate,
    required this.trustContact,
    required this.contactRelation,
    required this.medicalHistory,
    required this.sessions,
    required this.role,
    required this.V,
    required this.licIssuedDate,
    required this.licExpiryDate,
    required this.profession,
  });
  List<String> languages = [];
  bool? emailVerified;
  String? id;
  String? image;
  String? name;
  String? mobilePhone;
  String? gender;
  String? email;
  String? birthDate;
  String? trustContact;
  String? contactRelation;
  String? medicalHistory;
  List<String> sessions = [];
  String? role;
  int? V;
  String? licIssuedDate;
  String? licExpiryDate;
  String? profession;

  User.fromJson(Map<String, dynamic> json) {
    emailVerified = json['emailVerified'];
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    email = json['email'];
    birthDate = json['birthDate'];
    trustContact = json['trustContact'];
    contactRelation = json['contactRelation'];
    medicalHistory = json['medicalHistory'];
    role = json['role'];
    V = json['__v'];
    json['sessions'].forEach((element) {
      sessions.add(element);
    });
    json['languages'].forEach((element) {
      languages.add(element);
    });
    licIssuedDate = json['licIssuedDate'];
    licExpiryDate = json['licExpiryDate'];
    profession = json['profession'];
  }
}
