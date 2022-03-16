

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/usecases/UseCase.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/repositories/ms_recipes_repository.dart';

class AddFavorites implements UseCase<RecipeModel, ParamsAddFavorites>{
  final MSRecipesRepository _repository;

  AddFavorites(this._repository);

  @override
  Future<Either<Failure, RecipeModel>?> call(ParamsAddFavorites params) async {
   return _repository.addToFavorite(params.recipe);
  }
}

class ParamsAddFavorites  extends Equatable{
  final RecipeModel recipe;

  ParamsAddFavorites({required this.recipe});

  @override
  List<Object> get props => [];
}