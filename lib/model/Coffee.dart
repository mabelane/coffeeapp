import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Coffee {
  String imgPath = "";
  String title = "";
  String extras = "";
  String desc = "";
  double price = 0;
  double rating = 0;

  Coffee({
    required this.imgPath,
    required this.title,
    required this.extras,
    required this.desc,
    required this.price,
    required this.rating,
  });

  Coffee.fromJson(Map<String, dynamic> json) {
    imgPath = json["imgPath"];
    title = json["title"];
    extras = json["extras"];
    desc = json["desc"];
    price = json["price"];
    rating = json["rating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["imgPath"] = imgPath;
    data["title"] = title;
    data["extras"] = extras;
    data["desc"] = desc;
    data["price"] = price;
    data["rating"] = rating;
    return data;
  }
}
