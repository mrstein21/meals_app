import 'dart:convert';

List<Menu> listMenuFromJson(String response) {
  final jsonData = json.decode(response);
  final data = jsonData["meals"];
  return new List<Menu>.from(data.map((x) => Menu.fromJson(x)));
}

class Menu {
  String idMeal;
  String strMeal;
  String strMealThumb;

  Menu({this.idMeal, this.strMealThumb, this.strMeal});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        idMeal: json["idMeal"],
        strMealThumb: json["strMealThumb"],
        strMeal: json["strMeal"],
      );
}
