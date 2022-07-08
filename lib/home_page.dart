import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:master_chef_yemek_tarifleri/di/getx.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_event.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/favorite_page.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/recipe_list_search_bloc/recipe_list_page.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/blocs/random/recipe_random_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  final Key mKey = UniqueKey();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  var _pageSelector = 0;
  // final BannerAd myBanner = BannerAd(
  //   adUnitId: Platform.isAndroid
  //       ? "ca-app-pub-3940256099942544/6300978111"
  //       : "ca-app-pub-3940256099942544/2934735716",
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: BannerAdListener(),
  // );


  List<Widget> pageListBottomNavBar = [
    RecipeListPage(),
    FavoritePage(),
    RecipeRandomPage()
  ];


  @override
  void initState() {
    context.read<RecipeBloc>().add(GetRandomRecipeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FirebaseMessaging.onMessage.listen((event) {
      showDialog(context: context, builder: (context)=>AlertDialog(title: Text("mesaj geldiiii"),content: Text("geldiiiii"),));
    });

    final bloc =context.read<RecipeBloc>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageSelector,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.save_alt), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.stream), label: "")
        ],
        onTap: (selected) {
          _pageSelector = selected;
          if(_pageSelector == 0){
            bloc.add(GetRecipesWithPaginationEvent(bloc.counter));
          }
          if(_pageSelector == 2){
            bloc.add(GetRandomRecipeEvent());
          }
          setState(() {
          });
        },
      ),
      body: pageListBottomNavBar[_pageSelector], // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}