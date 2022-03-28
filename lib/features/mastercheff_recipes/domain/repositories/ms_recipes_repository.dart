
import 'package:dartz/dartz.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';

abstract class MSRecipesRepository {
  Future<Either<Failure, List<RecipeModel>>> getRecipesByPage(int pageNumber);
  Future<Either<Failure, RecipeModel>> getRecipeByID(int recipeID);
  Future<Either<Failure, RecipeModel>> getRecipeRandom();
  Future<Either<Failure, int>> addToFavorite(RecipeModel recipeModel);
  Future<Either<Failure, RecipeModel>> deleteFromFavorite(RecipeModel recipeModel);
  Future<Either<Failure, List<RecipeModel>>> searchRecipe(String query);
}