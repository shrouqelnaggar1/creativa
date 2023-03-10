

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) => List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
    HomeModel({
        required this.title,
        required this.description,
        required this.ingredients,
        required this.image,
        required this.id,
    });

    String title;
    String description;
    List<String> ingredients;
    String image;
    int id;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        title: json["title"],
        description: json["description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        image: json["image"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "image": image,
        "id": id,
    };
}
