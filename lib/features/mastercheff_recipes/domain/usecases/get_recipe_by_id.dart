

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/usecases/UseCase.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/repositories/ms_recipes_repository.dart';

class GetRecipeById implements UseCase<RecipeModel, ParamsGetRecipeById> {
  final MSRecipesRepository _repository;

  GetRecipeById(this._repository);

  @override
  Future<Either<Failure, RecipeModel>?> call(params) async {
    return await _repository.getRecipeByID(params.recipeID);
  }
}

class ParamsGetRecipeById extends Equatable {
  final int recipeID;

  const ParamsGetRecipeById({required this.recipeID});

  @override
  List<Object> get props => [recipeID];
}