class AddArticlesModel {
  AddArticlesModel({
    required this.message,
    required this.id,
  });
  late final String message;
  late final String id;

  AddArticlesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['id'] = id;
    return _data;
  }
}
