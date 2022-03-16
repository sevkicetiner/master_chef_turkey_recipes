

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/usecases/UseCase.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/repositories/ms_recipes_repository.dart';

class GetRecipesWithPagination implements UseCase<List<RecipeModel>, ParamsRecipesWithPag> {
  final MSRecipesRepository _repository;

  GetRecipesWithPagination(this._repository);

  @override
  Future<Either<Failure, List<RecipeModel>>?> call(ParamsRecipesWithPag params) async {
    return await _repository.getRecipesByPage(params.pageNumber);
  }
}

class ParamsRecipesWithPag extends Equatable {
  final int pageNumber;
  const ParamsRecipesWithPag({required this.pageNumber});

  @override
  List<Object?> get props =>[pageNumber];
}