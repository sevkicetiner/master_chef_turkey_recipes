import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_chef_yemek_tarifleri/core/utils/environment.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({Key? key, required this.recipeModel})
      : super(key: key);
  final RecipeModel recipeModel;

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  late Box<RecipeModel> boxRecive;

  Future<void> initHiveBox() async =>
      boxRecive = await Hive.openBox<RecipeModel>('Recipe');

  @override
  void initState() {
    initHiveBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          "${Environment.baseURL}recipes/getImage/${widget.recipeModel.localImage}",
          fit: BoxFit.fitHeight,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          "${Environment.baseURL}recipes/getImage/${widget.recipeModel.localImage}",
                          fit: BoxFit.fitHeight,
                          height: 500,
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                widget.recipeModel.baslikOrig ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Colors.black.withAlpha(0),
                                    Colors.black54,
                                    Colors.black54
                                  ],
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0x6d6d6d).withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Html(
                        data: widget.recipeModel.detay,
                        style: {
                          "body": Style(
                            fontSize: FontSize(18.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        },
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
