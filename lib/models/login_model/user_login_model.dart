class LoginModel {
  String? message;
  String? token;
  String? userId;
//  bool type = true;
/* 
  String? name;
  String? mobilePhone;
  String? gender;
  String? birthDate;
  String? trustContact;
  String? contactRelation;
  String? medicalHistory;
  String? sessions; */

  LoginModel({
    this.message,
    this.token,
    this.userId,
    /*   this.name,
      this.mobilePhone,
      this.gender,
      this.birthDate,
      this.trustContact,
      this.contactRelation,
      this.medicalHistory,
      this.sessions */
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    userId = json['id'];
    /*  name = json['name'];
    mobilePhone = json['mobilePhone'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    trustContact = json['trustContact'];
    contactRelation = json['contactRelation'];
    medicalHistory = json['medicalHistory'];
    sessions = json['sessions']; */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    data['id'] = userId;
    /* data['name'] = name;
    data['mobilePhone'] = mobilePhone;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    data['trustContact'] = trustContact;
    data['contactRelation'] = contactRelation;
    data['medicalHistory'] = medicalHistory;
    data['sessions'] = sessions; */
    return data;
  }
}
