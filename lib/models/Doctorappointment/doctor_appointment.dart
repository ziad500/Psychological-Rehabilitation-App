class DoctorAppointmentModel {
  DoctorAppointmentModel({
    required this.totalReservations,
    required this.totalbooking,
  });
  int? totalReservations;
  List<TotalBooking> totalbooking = [];

  DoctorAppointmentModel.fromJson(Map<String, dynamic> json) {
    totalReservations = json['totalReservations'];
    json['totalbooking'].forEach((element) {
      totalbooking.add(TotalBooking.fromJson(element));
    });
  }

  /*  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalReservations'] = totalReservations;
    _data['totalbooking'] = totalbooking.map((e) => e.toJson()).toList();
    return _data;
  }
 */
}

class TotalBooking {
  TotalBooking({
    required this.id,
    required this.userId,
    required this.doctor,
    required this.startDate,
    required this.date,
    required this.roomName,
  });
  String? id;
  UserId? userId;
  Doctor? doctor;
  String? startDate;
  String? date;
  String? roomName;

  TotalBooking.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    startDate = json['startDate'];
    date = json['date'];
    roomName = json['roomName'];
  }

  /*  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userId'] = userId!.toJson();
    _data['doctor'] = doctor!.toJson();
    _data['startDate'] = startDate;
    _data['date'] = date;
    _data['roomName'] = roomName;
    return _data;
  }
 */
}

class UserId {
  UserId({
    required this.id,
    required this.image,
    required this.name,
    //required this.mobilePhone,
    required this.gender,
    required this.email,
    /*  required this.birthDate,
    required this.trustContact,
    required this.contactRelation,
    required this.sessions, */
  });
  String? id;
  String? image;
  String? name;
/*    String mobilePhone;
 */
  String? gender;
  String? email;
  /*   String birthDate;
   String trustContact;
   String contactRelation;
   List<String> sessions; */

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    //  mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    email = json['email'];
    /*  birthDate = json['birthDate'];
    trustContact = json['trustContact'];
    contactRelation = json['contactRelation'];
    sessions = List.castFrom<dynamic, String>(json['sessions']); */
  }

  /* Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    //  _data['mobilePhone'] = mobilePhone;
    _data['gender'] = gender;
    _data['email'] = email;
    /*  _data['birthDate'] = birthDate;
    _data['trustContact'] = trustContact;
    _data['contactRelation'] = contactRelation;
    _data['sessions'] = sessions; */
    return _data;
  }
 */
}

class Doctor {
  Doctor({
    required this.id,
    required this.image,
    required this.name,
    required this.mobilePhone,
    //   required this.gender,
    required this.email,
    /*    required this.birthDate,
    required this.languages,
    required this.licIssuedDate,
    required this.licExpiryDate, */
    required this.profession,
    // required this.sessionPrice,
  });
  String? id;
  String? image;
  String? name;
  String? mobilePhone;
  //  String gender;
  String? email;
  /*   String birthDate;
   List<String> languages;
   String licIssuedDate;
   String licExpiryDate; */
  String? profession;
//   String sessionPrice;

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    mobilePhone = json['mobilePhone'];
    // gender = json['gender'];
    email = json['email'];
    /*  birthDate = json['birthDate'];
    languages = List.castFrom<dynamic, String>(json['languages']);
    licIssuedDate = json['licIssuedDate'];
    licExpiryDate = json['licExpiryDate']; */
    profession = json['profession'];
    // sessionPrice = json['sessionPrice'];
  }

  /*  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['mobilePhone'] = mobilePhone;
    // _data['gender'] = gender;
    _data['email'] = email;
    /*  _data['birthDate'] = birthDate;
    _data['languages'] = languages;
    _data['licIssuedDate'] = licIssuedDate;
    _data['licExpiryDate'] = licExpiryDate; */
    _data['profession'] = profession;
    // _data['sessionPrice'] = sessionPrice;
    return _data;
  }
 */
}
