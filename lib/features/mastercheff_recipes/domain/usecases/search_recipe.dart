

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/usecases/UseCase.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/repositories/ms_recipes_repository.dart';

class SearchRecipe extends UseCase<List<RecipeModel>, ParamsSearchRecipe> {
  MSRecipesRepository repository;

  SearchRecipe(this.repository);

  @override
  Future<Either<Failure, List<RecipeModel>>?> call(ParamsSearchRecipe params) async {
    return repository.searchRecipe(params.query);
  }

}

class ParamsSearchRecipe extends Equatable {
  String query;

  ParamsSearchRecipe(this.query);

  @override
  List<Object> get props => [query];
}