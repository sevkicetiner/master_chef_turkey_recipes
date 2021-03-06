import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';
import 'package:master_chef_yemek_tarifleri/core/usecases/UseCase.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/add_favarites.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_random_recipe.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipe_by_id.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipes_with_pagination.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/search_recipe.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_search_list_page.dart';

import 'recipe_event.dart';
import 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';
  static const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
  static const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input - The number must be a positive integer or zero.';
  List<RecipeModel> listRecipe = [];
  int counter = 0;
  GetRecipesWithPagination getRecipesWithPagination;
  SearchRecipe searchRecipe;
  RecipeBloc({
    required GetRecipeById getRecipeById,
    required this.getRecipesWithPagination,
    required GetRandomRecipe getRandomRecipe,
    required AddFavorites addFavorites,
    required this.searchRecipe
  }) : super(RecipeState().init()) {

    on<InitEvent>(_init);

    on<GetRandomRecipeEvent>((event, emit) async {
      emit(Loading());
      final result = await getRandomRecipe(NoParams());
      result.fold((l) => {
        emit(Error(Message: _mapFailureToMessage(l)))
      }, (r) {
        emit(Loaded(<RecipeModel>[r]));
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

    on<SearchRecipeEvent>((event, emit) async {
      emit(Loading());
      final response = await searchRecipe(ParamsSearchRecipe(event.searchText));
      response?.fold(
              (l) => emit(Error(Message: "error data fetch")),
              (r) => emit(Loaded(r)));
    });

    on<AddFavoriteEvent>((event, emit) async {
      emit(Loading());
      final response = await addFavorites(ParamsAddFavorites(recipe: event.recipeModel));
      response?.fold(
              (failure) {
                emit(Error(Message: _mapFailureToMessage(failure)));
              },
              (response) {
                emit(Loaded([]));
              });
    });
  }

  Future<List<RecipeModel>> getRecipePages(int page) async {
    print("getRecipePages cagirildi ${this.counter}");
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

  Future<List<RecipeModel>> search(String text) async {
    final response = await searchRecipe(ParamsSearchRecipe(text));
    response?.fold((l) {
      return [];
    }, (r) {
      return r;
    });
    return [];
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
