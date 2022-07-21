class ArticlesModel {
  List<ArticlesDataModel> articles = [];
  ArticlesModel.fromjson(Map<String, dynamic> json) {
    json['articles'].forEach((element) {
      articles.add(ArticlesDataModel.fromJson(element));
    });
  }
}

class ArticlesDataModel {
  ArticlesDataModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.cover,
    required this.createdAt,
    required this.doctor,
    required this.V,
  });
  String? id;
  String? title;
  String? content;
  String? category;
  String? cover;
  String? createdAt;
  Doctor? doctor;
  int? V;

  ArticlesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    content = json['content'];
    category = json['category'];
    cover = json['cover'];
    createdAt = json['createdAt'];
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['category'] = category;
    _data['cover'] = cover;
    _data['createdAt'] = createdAt;
    _data['doctor'] = doctor;
    _data['__v'] = V;
    return _data;
  }
}

class Doctor {
  Doctor({
    required this.id,
    required this.image,
    required this.name,
  });
  String? id;
  String? image;
  String? name;

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    return _data;
  }
}
