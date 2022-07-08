import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/exceptions.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/utils/environment.dart';
// import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/RecipeModelNew.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;
class MSRemoteDatasource {
  Future<List<RecipeModel>> getRecipesWithPagination(int page) async {
    Response data = await http.get(Uri.parse(Environment.baseURL + "recipes/${page}"),
        headers: {"token": Environment.token});
    if (data.statusCode == 200) {
      List list = jsonDecode(utf8.decode(data.bodyBytes));
      print(list.length);
      List<RecipeModel> response = [];
      list.forEach((element) {
        response.add(RecipeModel.fromJson(element));
      });
      return response;
    } else {
      throw ServerException();
    }
  }

  Future<RecipeModel> getRecipe(int id) async {
    Response data = await http.get(Uri.parse(Environment.baseURL + "recipes/id/$id"),
        headers: {"token": Environment.token});
    if (data.statusCode == 200) {
      return RecipeModel.fromJson(jsonDecode(data.body));
    } else {
      throw ServerException();
    }
  }

  Future<RecipeModel> getRandomRecipe() async {
    Response data = await http.get(Uri.parse(Environment.baseURL + "recipes/random"),
        headers: {"token": Environment.token, 'Accept-Charset': 'UTF-8', "Accept": "application/json"});
    if(data.statusCode == 200){
      String body = utf8.decode(data.bodyBytes);
      print(body);
      return RecipeModel.fromJson(jsonDecode(body));
    } else {
      throw ServerException();
    }
  }

  Future<List<RecipeModel>> searchRecipe(String query) async {
    Response data = await http.get(Uri.parse(Environment.baseURL+"recipes/search"),
        headers: {"token": Environment.token, "searchText": query, 'Accept-Charset': 'UTF-8', "Accept": "application/json"});
    if(data.statusCode == 200){
      String body = utf8.decode(data.bodyBytes);
      print(body);
      List list = jsonDecode(body);
      List<RecipeModel> response = [];
      list.forEach((element) {
        response.add(RecipeModel.fromJson((element)));
      });
      print("response lenght : "+response.length.toString());
      return response;
    } else {
      throw ServerException();
    }
  }

}
