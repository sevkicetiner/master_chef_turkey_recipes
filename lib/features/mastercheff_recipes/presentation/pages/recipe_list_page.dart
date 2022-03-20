import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_chef_yemek_tarifleri/di/getx.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/repositories/repository.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/domain/usecases/get_recipes_with_pagination.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_bloc.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_event.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/presentation/block/recipe_state.dart';
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
  double get _adWidth => MediaQuery.of(context).size.width - (2 * _insets);

  void _loadAd() async {
    // await _inlineAdaptiveAd?.dispose();
    // setState(() {
    //   // _inlineAdaptiveAd = null;
    //   _isLoaded = false;
    // });

    // Get an inline adaptive size for the current orientation.
    // AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
    //     _adWidth.truncate());
    //
    // _inlineAdaptiveAd = BannerAd(
    //   // TODO: replace this test ad unit with your own ad unit.
    //   adUnitId: Platform.isAndroid
    //       ? "ca-app-pub-2964559212718383/7759916462"
    //       : "ca-app-pub-2964559212718383/7625783585",
    //   size: size,
    //   request: const AdRequest(),
    //   listener: BannerAdListener(
    //     onAdLoaded: (Ad ad) async {
    //       print('Inline adaptive banner loaded: ${ad.responseInfo}');
    //
    //       BannerAd bannerAd = (ad as BannerAd);
    //       final AdSize? size = await bannerAd.getPlatformAdSize();
    //       if (size == null) {
    //         print('Error: getPlatformAdSize() returned null for $bannerAd');
    //         return;
    //       }
    //
    //       setState(() {
    //         _inlineAdaptiveAd = bannerAd;
    //         _isLoaded = true;
    //         _adSize = size;
    //       });
    //     },
    //     onAdFailedToLoad: (Ad ad, LoadAdError error) {
    //       print('Inline adaptive banner failedToLoad: $error');
    //       ad.dispose();
    //     },
    //   ),
    // );
    // await _inlineAdaptiveAd!.load();
  }

  // Widget _getAdWidget() {
  //   return OrientationBuilder(
  //     builder: (context, orientation) {
  //       if (_currentOrientation == orientation &&
  //           _inlineAdaptiveAd != null &&
  //           _isLoaded &&
  //           _adSize != null) {
  //         return Align(
  //             child: Container(
  //           width: _adWidth,
  //           height: _adSize!.height.toDouble(),
  //           child: AdWidget(
  //             ad: _inlineAdaptiveAd!,
  //           ),
  //         ));
  //       }
  //       // Reload the ad if the orientation changes.
  //       if (_currentOrientation != orientation) {
  //         _currentOrientation = orientation;
  //         _loadAd();
  //       }
  //       return Container();
  //     },
  //   );
  // }

  @override
  initState() {
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        bloc = context.read<RecipeBloc>();

        if (state is Empty) {
          return const Center(
            child: Text("Tarifler bos geldi"),
          );
        } else if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return _recipesListUpdate(context);
        } else if (state is Error) {
          return Center(child: Text(state.Message));
        }
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Placeholder(),
        );
      },
    );
  }

  Widget _recipesListUpdate(BuildContext context) {
    if (bloc.listRecipe.isEmpty) {
      return const Center(
        child: Text("bos geldi"),
      );
    }
    return Stack(
      children: [
        ListView.separated(
          itemCount: bloc.listRecipe.length + 1,
          itemBuilder: (context, index) {
            if (index != 0 && index == bloc.listRecipe.length) {
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
                  key: widget.key, recipeModel: bloc.listRecipe[index]);
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
            top: 35,
            left: 20,
            right: 20,
            child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                ),
              child: TextField(
                textInputAction: TextInputAction.search,
                controller: searchTextController,
                decoration: InputDecoration(
                    hintText: "Para onde vamos?",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => searchAndNavigate(searchTextController.text),
                      iconSize: 30.0,
                    )
                ),
                onSubmitted: searchAndNavigate,
              ),
            ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _inlineAdaptiveAd?.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentOrientation = MediaQuery.of(context).orientation;
    _loadAd();
  }

  void searchAndNavigate(String text) {
    bloc.add(SearchRecipeEvent(searchTextController.text));
  }
}
