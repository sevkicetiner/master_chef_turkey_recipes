
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_event.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_state.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_list_item_widget.dart';

class RecipeRandomPage extends StatefulWidget {
  const RecipeRandomPage({Key? key}) : super(key: key);

  @override
  State<RecipeRandomPage> createState() => _RecipeRandomPageState();
}

class _RecipeRandomPageState extends State<RecipeRandomPage> {
  final questionList = [
    "Buna ne dersin ?",
    "Bu guzel olabilir ?",
    "Bu cok nefis gorunuyor.",
    "Bunu kesin sevecekler",
    "Bunla insanlarin yemek algisini degistireceksin :)",
    "mmmmm super ?",
    "mmmmm nefis ?",
  ];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body:
          BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if(state is Loading) return Center(child: CircularProgressIndicator(),);
            if(state is Loaded) return buildContainer(state);
            if(state is Error) return Center(child: Text(state.Message),);
            return Container();
            },
        ),
      );
  }

  Container buildContainer(Loaded state) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(questionList[Random().nextInt(questionList.length)],
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        RecipeListItemWidget(
          recipeModel: state.list[0],
        ),
        ElevatedButton(onPressed: ()=>context.read<RecipeBloc>().add(GetRandomRecipeEvent()), child: Text("Begenmedim farkli birsey bul"))
      ],
    ),
  );
}
