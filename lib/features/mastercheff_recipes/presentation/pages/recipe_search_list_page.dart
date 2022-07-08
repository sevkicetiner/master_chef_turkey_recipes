

import 'package:flutter/material.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_list_item_widget.dart';

class RecipeSearchPage extends StatefulWidget {
  List<RecipeModel> list;

  RecipeSearchPage({Key? key, required this.list}) : super(key: key);

  @override
  State<RecipeSearchPage> createState() => _RecipeSearchPageState();
}

class _RecipeSearchPageState extends State<RecipeSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return RecipeListItemWidget(recipeModel: widget.list[index]);
        })
    );
  }
}
