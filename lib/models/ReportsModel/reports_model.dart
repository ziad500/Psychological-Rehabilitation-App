class GetReportModel {
  GetReportModel({
    required this.report,
  });
  late final List<Report> report;

  GetReportModel.fromJson(Map<String, dynamic> json) {
    report = List.from(json['report']).map((e) => Report.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['report'] = report.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Report {
  Report({
    required this.id,
    required this.userId,
    required this.doctor,
    required this.condition,
    required this.plan,
    required this.progress,
    required this.activities,
    required this.sessionType,
    required this.createdAt,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final Doctor doctor;
  late final String condition;
  late final String plan;
  late final String progress;
  late final String activities;
  late final String sessionType;
  late final String createdAt;
  late final int V;

  Report.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'];
    doctor = Doctor.fromJson(json['doctor']);
    condition = json['condition'];
    plan = json['plan'];
    progress = json['progress'];
    activities = json['activities'];
    sessionType = json['sessionType'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userId'] = userId;
    _data['doctor'] = doctor.toJson();
    _data['condition'] = condition;
    _data['plan'] = plan;
    _data['progress'] = progress;
    _data['activities'] = activities;
    _data['sessionType'] = sessionType;
    _data['createdAt'] = createdAt;
    _data['__v'] = V;
    return _data;
  }
}

class Doctor {
  Doctor({
    required this.id,
    required this.name,
    required this.profession,
  });
  late final String id;
  late final String name;
  late final String profession;

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['profession'] = profession;
    return _data;
  }
}
