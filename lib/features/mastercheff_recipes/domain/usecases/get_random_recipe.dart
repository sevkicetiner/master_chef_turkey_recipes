


import 'package:dartz/dartz.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/usecases/UseCase.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/repositories/ms_recipes_repository.dart';

class GetRandomRecipe implements UseCase<RecipeModel, NoParams>{
  final MSRecipesRepository _repository;

  GetRandomRecipe(this._repository);

  @override
  Future<Either<Failure, RecipeModel>?> call(NoParams params) async {
    // return await _repository.getRecipeRandom();
    return Future.value(null);
  }
}
