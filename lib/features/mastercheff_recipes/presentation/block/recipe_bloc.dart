import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/usecases/UseCase.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/add_favarites.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_random_recipe.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipe_by_id.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipes_with_pagination.dart';

import 'recipe_event.dart';
import 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';
  static const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
  static const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input - The number must be a positive integer or zero.';
  List<RecipeModel> listRecipe = [];
  int counter = 0;
  GetRecipesWithPagination getRecipesWithPagination;

  RecipeBloc({
    required GetRecipeById getRecipeById,
    required this.getRecipesWithPagination,
    required GetRandomRecipe getRandomRecipe,
    required AddFavorites addFavorites,
  }) : super(RecipeState().init()) {

    on<InitEvent>(_init);

    on<GetRandomRecipeEvent>((event, emit) async {
      emit(Loading());
      final failureOrRecipe = await getRandomRecipe(NoParams());
      failureOrRecipe?.fold((l) => {
        emit(Error(Message: _mapFailureToMessage(l)))
      }, (r) {
        // emit(Loaded(recipes: <RecipeModel>[r]));
      });
    });

    on<GetRecipesWithPaginationEvent>((event, emit) async {
      emit(Loading());
      final failureOrRecipeList = await getRecipesWithPagination(ParamsRecipesWithPag(pageNumber: event.pageNumber));
      failureOrRecipeList.fold(
              (failure) => emit(Error( Message: _mapFailureToMessage(failure))),
              (recipeList) {
                this.listRecipe.addAll(recipeList);
                emit(Loaded(this.listRecipe));
              }
      );
    });

    on<SearchRecipeEvent>((event, emit){

    });
  }

  Future<List<RecipeModel>> getRecipePages(int page) async {
    final failureOrRecipeList = await getRecipesWithPagination(ParamsRecipesWithPag(pageNumber: this.counter));
    return failureOrRecipeList.fold(
            (failure) => [],
            (recipeList) {
              this.listRecipe.addAll(recipeList);
              counter++;
              return listRecipe;
            }
    );
  }

  void _init(InitEvent event, Emitter<RecipeState> emit) async {
    emit(state.clone());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
