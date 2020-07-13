import 'package:flutter/foundation.dart';
import 'package:meals_app/model/menu.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/utils/server.dart';

abstract class MenuRepository {
  Future<List<Menu>> getMenu(String nation);
  Future<List<Menu>> getMenyByCategory(String category);
  Future<List<Menu>> getMenuByArea(String area);
  Future<List<Menu>> getSearchMenu(String keyword);
  Future<String> getMenuRecipe(String id);
}

class MenuRepositoryImp extends MenuRepository {
  @override
  Future<List<Menu>> getMenu(String nation) async {
    var response = await http.get(Server.url + "/filter.php?a=" + nation);
    if (response.statusCode == 200) {
      return compute(listMenuFromJson, response.body);
    } else {
      throw Exception();
    }
    // TODO: implement getMenu
  }

  @override
  Future<List<Menu>> getMenyByCategory(String category) async {
    var response = await http.get(Server.url + "/filter.php?c=" + category);
    if (response.statusCode == 200) {
      return compute(listMenuFromJson, response.body);
    } else {
      throw Exception();
    }
    // TODO: implement getMenyByCategory
  }

  @override
  Future<List<Menu>> getSearchMenu(String keyword) async {
    var response = await http.get(Server.url + "/search.php?s=" + keyword);
    if (response.statusCode == 200) {
      print(response.body);
      return compute(listMenuFromJson, response.body);
    } else {
      throw Exception();
    }
    // TODO: implement getSearchMenu
  }

  @override
  Future<String> getMenuRecipe(String id) async {
    var response = await http.get(Server.url + "/lookup.php?i=" + id);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
    // TODO: implement getMenuRecipe
  }

  @override
  Future<List<Menu>> getMenuByArea(String area) async {
    var response = await http.get(Server.url + "/filter.php?a=" + area);
    if (response.statusCode == 200) {
      return compute(listMenuFromJson, response.body);
    } else {
      throw Exception();
    }
    // TODO: implement getMenuByArea
  }
}
