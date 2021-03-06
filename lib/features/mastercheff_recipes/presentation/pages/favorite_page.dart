
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_list_item_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  late Box<RecipeModel> box;

  Future<void> initHiveBox() async =>
      box = await Hive.openBox<RecipeModel>('Recipe');

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<RecipeModel>("Recipe");
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100, left: 50, bottom: 50),
            child: const Text("Kaydettiklerin",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ),
           ...box.values.map((e) => RecipeListItemWidget(recipeModel: e)).toList()]
        // box.values.map((e) => RecipeListItemWidget(recipeModel: e)).toList(),
      ),
    );
  }
}
