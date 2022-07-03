class ReviewModel {
  ReviewModel({
    required this.reviews,
  });
  List<Reviews> reviews = [];

  ReviewModel.fromJson(Map<String, dynamic> json) {
    json['reviews'].forEach((element) {
      reviews.add(Reviews.fromJson(element));
    });
  }

/*   Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reviews'] = reviews.map((e) => e.toJson()).toList();
    return _data;
  } */
}

class Reviews {
  Reviews({
    required this.id,
    required this.rating,
    required this.comment,
    required this.doctorId,
    required this.user,
    required this.createdAt,
    required this.V,
  });
  String? id;
  int? rating;
  String? comment;
  String? doctorId;
  User? user;
  String? createdAt;
  int? V;

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    rating = json['rating'];
    comment = json['comment'];
    doctorId = json['doctorId'];
    user = User.fromJson(json['user']);
    createdAt = json['createdAt'];
    V = json['__v'];
  }

/*   Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['rating'] = rating;
    _data['comment'] = comment;
    _data['doctorId'] = doctorId;
    _data['user'] = user.toJson();
    _data['createdAt'] = createdAt;
    _data['__v'] = V;
    return _data;
  } */
}

class User {
  User({
    required this.id,
    required this.image,
    required this.name,
  });
  late final String id;
  late final String image;
  late final String name;

  User.fromJson(Map<String, dynamic> json) {
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
