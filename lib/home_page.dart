import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:master_chef_yemek_tarifleri/di/getx.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_event.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/favorite_page.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_list_page.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/pages/recipe_random_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final Key mKey = UniqueKey();
  final String title;

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
    // myBanner.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getInstance<RecipeBloc>()..add(InitEvent()), //  getInstance<RecipeBloc>()..add(InitEvent()),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.save_alt), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.stream), label: "")
          ],
          onTap: (selected) {
            _pageSelector = selected;
            setState(() {
            });
          },
        ),
        body: pageListBottomNavBar[_pageSelector], // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}