import 'dart:convert';

List<Categories> listCategoryFromJson(String response) {
  final jsonData = json.decode(response);
  final data = jsonData["categories"];
  return new List<Categories>.from(data.map((x) => Categories.fromJson(x)));
}

class Categories {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Categories(
      {this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
      idCategory: json["idCategory"],
      strCategory: json["strCategory"],
      strCategoryThumb: json["strCategoryThumb"],
      strCategoryDescription: json["strCategoryDescription"]);
}
