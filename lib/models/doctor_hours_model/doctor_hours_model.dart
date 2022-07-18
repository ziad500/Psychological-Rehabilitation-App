class DoctorHoursModel {
  DoctorHoursModel({
    required this.id,
    required this.image,
    required this.name,
    required this.calender,
  });
  String? id;
  String? image;
  String? name;
  List<Calender> calender = [];

  DoctorHoursModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    calender =
        List.from(json['calender']).map((e) => Calender.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['calender'] = calender.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Calender {
  Calender({
    required this.id,
    required this.weekday,
    required this.date,
    required this.startAt,
    required this.endAt,
    required this.isSelected,
  });
  String? id;
  String? weekday;
  String? date;
  String? startAt;
  String? endAt;
  bool? isSelected = false;

  Calender.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    weekday = json['weekday'];
    date = json['date'];
    startAt = json['startAt'];
    endAt = json['endAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['weekday'] = weekday;
    _data['date'] = date;
    _data['startAt'] = startAt;
    _data['endAt'] = endAt;
    return _data;
  }
}
