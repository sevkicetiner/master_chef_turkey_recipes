import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_chef_yemek_tarifleri/di/getx.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/repositories/repository.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipes_with_pagination.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_event.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_state.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_list_item_widget.dart';
import 'package:master_chef_yemek_tarifleri/main.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  var mKey = const Key("RecipeListPage");
  static const _insets = 16.0;

  // BannerAd? _inlineAdaptiveAd;
  bool _isLoaded = false;

  // AdSize? _adSize;
  late Orientation _currentOrientation;
  late RecipeBloc bloc;
  TextEditingController searchTextController = TextEditingController();

  String? token;
  bool isSearched = false;

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) {
      token = event.notification?.title;
      setState(() => {});
    });

    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        bloc = context.read<RecipeBloc>();

        if (state is Empty) {
          return const Center(
            child: Text("Hic bir tarif bulunamadi"),
          );
        }
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Loaded) {
          return _recipesListUpdate(context, state.list);
        }
        if (state is LoadedSearchList) {
          print("gelen liste ${state.list.length}");
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    child: ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return RecipeListItemWidget(
                            recipeModel: state.list[index],
                          );
                        }),
                  );
                });
          });
        }

        if (state is Error) {
          return Center(child: Text(state.Message));
        }
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Placeholder(),
        );
      },
    );
  }

  Widget _recipesListUpdate(BuildContext context, List<RecipeModel> list) {
    // if (list.isEmpty) {
    //   return const Center(
    //     child: Text("bos geldi"),
    //   );
    // }
    return Stack(
      children: [
        ListView.separated(
          itemCount: list.length + 1,
          itemBuilder: (context, index) {
            if (index != 0 && index == list.length && _isLoaded) {
              print("index ve recipe lenght esit");
              bloc
                  .getRecipePages(bloc.counter)
                  .then((value) => setState(() {}));
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return RecipeListItemWidget(
                  key: widget.key, recipeModel: list[index]);
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index % 5 == 0) {
              // return _getAdWidget();
              return Container();
            } else {
              return Container();
            }
          },
        ),
        Positioned(
          top: Platform.isAndroid ? 50 : 70,
          left: 20,
          right: 20,
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: searchTextController,
              decoration: InputDecoration(
                hintText: "masterchef de yapilan yemeklerde ara?",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => searchAndNavigate(searchTextController.text),
                  iconSize: 30.0,
                ),
                prefixIcon: isSearched
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          searchTextController.clear();
                          bloc.add(GetRecipesWithPaginationEvent(bloc.counter));
                          isSearched = false;
                          },
                      )
                    : null,
              ),
              onSubmitted: searchAndNavigate,
            ),
          ),
        )
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentOrientation = MediaQuery.of(context).orientation;
  }

  void searchAndNavigate(String text) {
    bloc.add(SearchRecipeEvent(searchTextController.text));
    isSearched = true;
  }
}
