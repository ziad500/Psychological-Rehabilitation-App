class UserModel {
  String? message;
  String? token;
  String? userId;
  bool type = true;

  String? name;
  String? mobilePhone;
  String? gender;
  String? birthDate;
  String? trustContact;
  String? contactRelation;
  String? medicalHistory;
  String? sessions;

  UserModel(
      {this.message,
      this.token,
      this.userId,
      this.name,
      this.mobilePhone,
      this.gender,
      this.birthDate,
      this.trustContact,
      this.contactRelation,
      this.medicalHistory,
      this.sessions});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    userId = json['userId'];
    name = json['name'];
    mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    trustContact = json['trustContact'];
    contactRelation = json['contactRelation'];
    medicalHistory = json['medicalHistory'];
    sessions = json['sessions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['mobilePhone'] = this.mobilePhone;
    data['gender'] = this.gender;
    data['birthDate'] = this.birthDate;
    data['trustContact'] = this.trustContact;
    data['contactRelation'] = this.contactRelation;
    data['medicalHistory'] = this.medicalHistory;
    data['sessions'] = this.sessions;
    return data;
  }
}
