import 'package:get_it/get_it.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/datasources/local_datasource.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/datasources/remote_datasource.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/repositories/repository.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/repositories/ms_recipes_repository.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/add_favarites.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_random_recipe.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipe_by_id.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipes_with_pagination.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/search_recipe.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_bloc.dart';

final getInstance = GetIt.instance;

Future<void> init() async {
  getInstance.registerFactory(() => RecipeBloc(
        getRecipeById: getInstance<GetRecipeById>(),
        getRecipesWithPagination: getInstance<GetRecipesWithPagination>(),
        addFavorites: getInstance<AddFavorites>(),
        getRandomRecipe: getInstance<GetRandomRecipe>(),
        searchRecipe: getInstance<SearchRecipe>()
  ));
  getInstance.registerLazySingleton(() => SearchRecipe(getInstance<MSRecipesRepository>()));
  getInstance.registerLazySingleton(() => GetRecipeById(getInstance<MSRecipesRepository>()));
  getInstance.registerLazySingleton(() => GetRecipesWithPagination(getInstance<MSRecipesRepository>()));
  getInstance.registerLazySingleton(() => AddFavorites(getInstance<MSRecipesRepository>()));
  getInstance.registerLazySingleton(() => GetRandomRecipe(getInstance<MSRecipesRepository>()));

  getInstance.registerLazySingleton(() => MSRemoteDatasource());
  getInstance.registerLazySingleton(() => MSLocalDatasource());
  getInstance.registerLazySingleton<MSRecipesRepository>(() => Repository(getInstance<MSRemoteDatasource>(), getInstance<MSLocalDatasource>()));

}
