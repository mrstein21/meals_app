import 'package:flutter/foundation.dart';
import 'package:meals_app/model/categories.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/utils/server.dart';

abstract class CategoryRepository {
  Future<List<Categories>> getCategory();
}

class CategoryRepositoryImp extends CategoryRepository {
  @override
  Future<List<Categories>> getCategory() async {
    var response = await http.get(Server.url + "/categories.php");
    if (response.statusCode == 200) {
      print(response.body);
      return compute(listCategoryFromJson, response.body);
    } else {
      throw Exception();
    }
  }
}
