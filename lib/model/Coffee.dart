import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Coffee {
  String image = "";
  String title = "";
  String extras = "";
  String desc = "";
  double price = 0;
  double rating = 0;

  Coffee({
    required this.image,
    required this.title,
    required this.extras,
    required this.desc,
    required this.price,
    required this.rating,
  });

  Coffee.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
    extras = json["extras"];
    desc = json["desc"];
    price = json["price"];
    rating = json["rating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["image"] = image;
    data["title"] = title;
    data["extras"] = extras;
    data["desc"] = desc;
    data["price"] = price;
    data["rating"] = rating;
    return data;
  }
}
