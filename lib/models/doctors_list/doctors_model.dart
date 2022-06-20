class DoctorsModel {
  List<DoctorsDataModel> doctors = [];
  DoctorsModel.fromjson(Map<String, dynamic> json) {
    json['doctors'].forEach((element) {
      doctors.add(DoctorsDataModel.fromJson(element));
    });
  }
}

class DoctorsDataModel {
  DoctorsDataModel({
    required this.emailVerified,
    required this.id,
    required this.image,
    required this.name,
    required this.mobilePhone,
    required this.gender,
    required this.email,
    required this.birthDate,
    required this.sessions,
    required this.languages,
    required this.licIssuedDate,
    required this.licExpiryDate,
    required this.profession,
    required this.role,
    required this.V,
  });
  bool? emailVerified;
  String? id;
  String? image;
  String? name;
  String? mobilePhone;
  String? gender;
  String? email;
  String? birthDate;
  List<String> sessions = [];
  List<String> languages = [];
  String? licIssuedDate;
  String? licExpiryDate;
  String? profession;
  String? role;
  int? V;

  DoctorsDataModel.fromJson(Map<String, dynamic> json) {
    emailVerified = json['emailVerified'];
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    email = json['email'];
    birthDate = json['birthDate'];
    json['sessions'].forEach((element) {
      sessions.add(element);
    });
    json['languages'].forEach((element) {
      languages.add(element);
    });
/*     sessions = json['sessions'];
 */
/*     languages = json['languages'];
 */
    licIssuedDate = json['licIssuedDate'];
    licExpiryDate = json['licExpiryDate'];
    profession = json['profession'];
    role = json['role'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['emailVerified'] = emailVerified;
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['mobilePhone'] = mobilePhone;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['birthDate'] = birthDate;
    _data['sessions'] = sessions;

    _data['languages'] = languages;

    _data['licIssuedDate'] = licIssuedDate;
    _data['licExpiryDate'] = licExpiryDate;
    _data['profession'] = profession;
    _data['role'] = role;
    _data['__v'] = V;
    return _data;
  }
}

















/* class DoctorsModel {
  List<DoctorsDataModel> doctors = [];
  DoctorsModel.fromjson(Map<String, dynamic> json) {
    json['doctors'].forEach((element) {
      doctors.add(DoctorsDataModel.fromJson(element));
    });
  }
}

class DoctorsDataModel {
  DoctorsDataModel({
    required this.emailVerified,
    required this.id,
    required this.image,
    required this.name,
    required this.mobilePhone,
    required this.gender,
    required this.email,
    required this.birthDate,
    required this.sessions,
    required this.languages,
    required this.licIssuedDate,
    required this.licExpiryDate,
    required this.profession,
    required this.role,
    required this.V,
  });
  late final bool? emailVerified;
  late final String id;
  late final String image;
  late final String name;
  late final String mobilePhone;
  late final String gender;
  late final String email;
  late final String birthDate;
  late final List<String> sessions;
  late final List<String> languages;
  late final String licIssuedDate;
  late final String licExpiryDate;
  late final String profession;
  late final String? role;
  late final int V;

  DoctorsDataModel.fromJson(Map<String, dynamic> json) {
    emailVerified = json['emailVerified'];
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    email = json['email'];
    birthDate = json['birthDate'];
    sessions = List.castFrom<dynamic, String>(json['sessions']);
    languages = json['languages'];
    licIssuedDate = json['licIssuedDate'];
    licExpiryDate = json['licExpiryDate'];
    profession = json['profession'];
    role = json['role'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['emailVerified'] = emailVerified;
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['mobilePhone'] = mobilePhone;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['birthDate'] = birthDate;
    _data['sessions'] = sessions;
    _data['languages'] = languages;
    _data['licIssuedDate'] = licIssuedDate;
    _data['licExpiryDate'] = licExpiryDate;
    _data['profession'] = profession;
    _data['role'] = role;
    _data['__v'] = V;
    return _data;
  }
}
 */