


import 'package:hive/hive.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/exceptions.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';

class MSLocalDatasource {

  late Box<RecipeModel> boxRecive;

  Future<void> initHiveBox() async =>
      boxRecive = await Hive.openBox<RecipeModel>('Recipe');

  MSLocalDatasource(){
    initHiveBox();
  }

  Future<int> addToFavorite(RecipeModel recipeModel) async{
    try{
      await boxRecive.add(recipeModel);
      await recipeModel.save();
      return 1;
    } catch (error){
      throw CachException;
    }
  }

  Future<void> deleteFromFavorite(RecipeModel recipeModel) async{
    try{
      return await recipeModel.delete();
    } catch (error){
      throw CachException;
    }
  }
}