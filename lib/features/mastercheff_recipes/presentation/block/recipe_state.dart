import 'package:equatable/equatable.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';

class RecipeState extends Equatable{

  RecipeState();

  RecipeState init() {
    return RecipeState();
  }

  RecipeState clone() {
    return RecipeState();
  }

  @override
  List<Object?> get props => [];
}

class Empty extends RecipeState{}

class Loading extends RecipeState {}

class Loaded extends RecipeState {
}

class Error extends RecipeState {
  final String Message;

  Error({required this.Message});
}