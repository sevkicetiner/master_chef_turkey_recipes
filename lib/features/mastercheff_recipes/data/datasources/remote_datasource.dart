import 'dart:convert';

import 'package:http/http.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/exceptions.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/utils/environment.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/Recipemodel.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;
class RecipesRemoteDatasource {
  Future<List<RecipeModel>> getRecipesWithPagination(int page) async {
    Response data = await http.get(Uri.parse(Environment.baseURL + "recipes/${page}"),
        headers: {"token": Environment.token});
    if (data.statusCode == 200) {
      List list = jsonDecode(data.body);
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
        headers: {"token": Environment.token});
    if(data.statusCode == 200){
      return RecipeModel.fromJson(data.body);
    } else {
      throw ServerException();
    }
  }

}
