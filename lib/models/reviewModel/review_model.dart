// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ReviewModel welcomeFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String welcomeToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    this.reviews,
  });

  List<Review>? reviews;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    this.id,
    this.rating,
    this.comment,
    this.doctorId,
    this.user,
    this.createdAt,
    this.v,
  });

  String? id;
  double? rating;
  String? comment;
  String? doctorId;
  User? user;
  DateTime? createdAt;
  int? v;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        rating: json["rating"].toDouble(),
        comment: json["comment"],
        doctorId: json["doctorId"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rating": rating,
        "comment": comment,
        "doctorId": doctorId,
        "user": user!.toJson(),
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}

class User {
  User({
    this.id,
    this.image,
    this.name,
  });

  String? id;
  String? image;
  String? name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "name": name,
      };
}
