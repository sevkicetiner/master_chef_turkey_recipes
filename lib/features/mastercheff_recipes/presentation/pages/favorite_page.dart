
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


  @override
  Widget build(BuildContext context) {
    var box = Hive.box<RecipeModel>("Recipe");
    return Container(
      child: ListView(
        children: box.values.map((e) => RecipeListItemWidget(recipeModel: e)).toList()
        // box.values.map((e) => RecipeListItemWidget(recipeModel: e)).toList(),
      ),
    );
  }
}
