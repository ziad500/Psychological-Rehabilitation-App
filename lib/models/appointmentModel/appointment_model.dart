class AppointmentModel {
  AppointmentModel({
    required this.totalReservations,
    required this.allReservations,
  });
  late final int totalReservations;
  late final List<AllReservations> allReservations;

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    totalReservations = json['totalReservations'];
    allReservations = List.from(json['allReservations'])
        .map((e) => AllReservations.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalReservations'] = totalReservations;
    _data['allReservations'] = allReservations.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AllReservations {
  AllReservations({
    required this.id,
    required this.userId,
    required this.doctor,
    required this.startDate,
    required this.date,
    required this.roomName,
  });
  late final String id;
  late final UserId userId;
  late final Doctor doctor;
  late final String startDate;
  late final String date;
  late final String roomName;

  AllReservations.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = UserId.fromJson(json['userId']);
    doctor = Doctor.fromJson(json['doctor']);
    startDate = json['startDate'];
    date = json['date'];
    roomName = json['roomName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userId'] = userId.toJson();
    _data['doctor'] = doctor.toJson();
    _data['startDate'] = startDate;
    _data['date'] = date;
    _data['roomName'] = roomName;
    return _data;
  }
}

class UserId {
  UserId({
    required this.id,
    required this.image,
    required this.name,
    required this.mobilePhone,
    required this.gender,
    required this.email,
    required this.birthDate,
    required this.trustContact,
    required this.contactRelation,
    required this.sessions,
  });
  late final String id;
  late final String image;
  late final String name;
  late final String mobilePhone;
  late final String gender;
  late final String email;
  late final String birthDate;
  late final String trustContact;
  late final String contactRelation;
  late final List<String> sessions;

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    email = json['email'];
    birthDate = json['birthDate'];
    trustContact = json['trustContact'];
    contactRelation = json['contactRelation'];
    sessions = List.castFrom<dynamic, String>(json['sessions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['mobilePhone'] = mobilePhone;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['birthDate'] = birthDate;
    _data['trustContact'] = trustContact;
    _data['contactRelation'] = contactRelation;
    _data['sessions'] = sessions;
    return _data;
  }
}

class Doctor {
  Doctor({
    required this.id,
    required this.image,
    required this.name,
    required this.mobilePhone,
    required this.gender,
    required this.email,
    required this.birthDate,
    required this.languages,
    required this.licIssuedDate,
    required this.licExpiryDate,
    required this.profession,
    required this.sessionPrice,
  });
  late final String id;
  late final String image;
  late final String name;
  late final String mobilePhone;
  late final String gender;
  late final String email;
  late final String birthDate;
  late final List<String> languages;
  late final String licIssuedDate;
  late final String licExpiryDate;
  late final String profession;
  late final String sessionPrice;

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    email = json['email'];
    birthDate = json['birthDate'];
    languages = List.castFrom<dynamic, String>(json['languages']);
    licIssuedDate = json['licIssuedDate'];
    licExpiryDate = json['licExpiryDate'];
    profession = json['profession'];
    sessionPrice = json['sessionPrice'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['mobilePhone'] = mobilePhone;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['birthDate'] = birthDate;
    _data['languages'] = languages;
    _data['licIssuedDate'] = licIssuedDate;
    _data['licExpiryDate'] = licExpiryDate;
    _data['profession'] = profession;
    _data['sessionPrice'] = sessionPrice;
    return _data;
  }
}
