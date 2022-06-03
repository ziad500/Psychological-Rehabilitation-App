class DoctorRegisterModel {
  String? message;
  String? id;
  Data? data;

  DoctorRegisterModel({this.message, this.data});

  DoctorRegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  String? value;
  String? msg;
  String? param;
  String? location;

  Data({this.value, this.msg, this.param, this.location});

  Data.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['msg'] = this.msg;
    data['param'] = this.param;
    data['location'] = this.location;
    return data;
  }
}
