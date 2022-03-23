import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:master_chef_yemek_tarifleri/core/utils/environment.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_detail_page.dart';

class RecipeListItemWidget extends StatelessWidget {
  const RecipeListItemWidget({
    Key? key,
    required this.recipeModel
  }) : super(key: key);

  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RecipeDetailPage(key: key,recipeModel: recipeModel,)));
      },
      child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [

            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("${Environment.baseURL}recipes/getImage/${recipeModel.localImage}"))),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 120,
                child: Text(
                  recipeModel.baslikOrig ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0),
                        Colors.black38,
                        Colors.black54
                      ],
                    )
                ),
              ),
            ),
            Positioned(
              top: 10, left: 0,right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.add_circle)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
