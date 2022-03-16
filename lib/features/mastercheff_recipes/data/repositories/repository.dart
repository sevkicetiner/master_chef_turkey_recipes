import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/exceptions.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/utils/mongo_db_connection.dart';
import 'package:http/http.dart' as http;
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/datasources/remote_datasource.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/repositories/ms_recipes_repository.dart';
// import 'package:mongo_dart/mongo_dart.dart';

class Repository implements MSRecipesRepository{
  RecipesRemoteDatasource _recipesRemoteDatasource;
  Repository(this._recipesRemoteDatasource);

  Future<String> createClaass(RecipeModel recipeModel) async {
    const keyApplicationId = 'aIdalP1zd7SPD9jbog7zs9p6k7tLp7zgRx0q6C8B';
    const keyClientKey = 'dcagschykIghBu7HoYaF78n9KGdtuh6JgziP5pBg';
    const keyParseServerUrl =
        'https://parseapi.back4app.com/classes/recipesNew';
    return await http.post(Uri.parse(keyParseServerUrl), headers: {
      "X-Parse-Application-Id": "aIdalP1zd7SPD9jbog7zs9p6k7tLp7zgRx0q6C8B",
      "X-Parse-Master-Key": "dcagschykIghBu7HoYaF78n9KGdtuh6JgziP5pBg",
      "Content-Type":"application/json"
    }, body: {
      "className": "recipesNew",
      "fields": {...recipeModel.toJson()}
    }).toString();
  }

  // Future<List<Map<String, dynamic>>> getAllItems() async {
  //   // var connection = await MongoDBConnection.instance.getConnection();
  //   var list = connection.collection("recipes").find().toList();
  //   return list;
  // }

  Future<Stream<String>> getStream() async {
    var streamedResponse = await http.Request("GET",Uri.parse(
        "http://192.168.1.24:8080/recipes/getStreamData")).send();
    return streamedResponse.stream.toStringStream();
    // Response data = await http.get(Uri.parse(
    //     "http://localhost:8080/recipes/getStream"), headers: {"token":"dcagschykIghBu7HoYaF78n9KGdtuh6JgziP5pBg"});
    // if (data.statusCode == 200) {
    //   List<dynamic> list = jsonDecode(data.body);
    //   return list.map((e) => RecipeModel.fromJson(e)).toList();
    // } else {
    //   return null;
    // }
  }

  // Future<List<RecipeModel>> getAllItemsPagination(int page) async {
  //   var connection = await MongoDBConnection.instance.getConnection();
  //   var list = await connection.collection("recipes").find(where.sortBy("id", descending: true).limit(20).skip(300)).toList();
  //   return list.map((e) => RecipeModel.fromJson(e)).toList();
  // }

  @override
  Future<Either<Failure, RecipeModel>> addToFavorite(RecipeModel recipeModel) {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecipeModel>> deleteFromFavorite(RecipeModel recipeModel) {
    // TODO: implement deleteFromFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecipeModel>> getRecipeByID(int recipeID) async {
    try {
      return Right( await _recipesRemoteDatasource.getRecipe(recipeID));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RecipeModel>> getRecipeRandom() async {
    try{
      return Right(await _recipesRemoteDatasource.getRandomRecipe());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RecipeModel>>> getRecipesByPage(int pageNumber) async {
    try {
       return Right(await _recipesRemoteDatasource.getRecipesWithPagination(pageNumber));
    } on ServerException {
      return Left(ServerFailure());
    }

  }
}
