import 'package:equatable/equatable.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';

abstract class RecipeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitEvent extends RecipeEvent {}

class GetRecipesWithPaginationEvent extends RecipeEvent{
  final int pageNumber;
  GetRecipesWithPaginationEvent(this.pageNumber);
}

class GetRandomRecipeEvent extends RecipeEvent {}

class GetRecipeByIdEvent extends RecipeEvent {
  final int id;

  GetRecipeByIdEvent(this.id);
}

class AddFavoriteEvent extends RecipeEvent {
  final RecipeModel recipeModel;

  AddFavoriteEvent(this.recipeModel);
}

class SearchRecipeEvent extends RecipeEvent {
  String searchText;

  SearchRecipeEvent(this.searchText);
}