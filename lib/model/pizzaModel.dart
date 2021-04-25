// To parse this JSON data, do
//
//     final pizzaModel = pizzaModelFromJson(jsonString);

import 'dart:convert';

PizzaModel pizzaModelFromJson(String str) => PizzaModel.fromJson(json.decode(str));

String pizzaModelToJson(PizzaModel data) => json.encode(data.toJson());

class PizzaModel {

  int id;
  String title;
  String price;
  String rating;
  String img;
  String details;

  PizzaModel({
    this.id,
    this.title,
    this.price,
    this.rating,
    this.img,
    this.details,
  });

  factory PizzaModel.fromJson(Map<String, dynamic> json) => PizzaModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    rating: json["rating"],
    img: json["img"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "rating": rating,
    "img": img,
    "details": details,
  };
}
