import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_state.dart';

class RecipeRandomPage extends StatelessWidget {
  const RecipeRandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if(state is Loading) return Center(child: CircularProgressIndicator(),);
          if(state is Loaded) return Container(child: Center(child: Text(state.list[0].toString()),),);
          return Container();
          },
      );
  }
}
