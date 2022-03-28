import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_chef_yemek_tarifleri/core/utils/environment.dart';
import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
import 'package:master_chef_yemek_tarifleri/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'di/getx.dart';

var lastItemCount = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  final path = await getApplicationDocumentsDirectory();
  init();
  await dotenv.load(fileName: Environment.getBuildVariant());
  Hive.init(path.path);
  Hive.registerAdapter(RecipeModelAdapter());
  await Hive.openBox<RecipeModel>("Recipe");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage()
      // Scaffold(
      //     body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Container(
      //       color: Colors.blue,
      //       height: 300,
      //     ),
      //     Container(
      //       margin: EdgeInsets.all(20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             "Master Chef Yemek Tarifleri",
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Container(
      //               height: 120,
      //               child: ListView.builder(
      //                   scrollDirection: Axis.horizontal,
      //                   itemCount: 20,
      //                   itemBuilder: (context, index) {
      //                     return Container(
      //                       color: Colors.amber,
      //                       height: 100,
      //                       width: 100,
      //                       margin: EdgeInsets.all(10),
      //                     );
      //                   })),
      //           Row(
      //             children: [
      //               Spacer(),
      //               TextButton(
      //                   onPressed: () {
      //                     print("basildi");
      //                     Navigator.of(context).push(
      //                         MaterialPageRoute(
      //                             builder: (contex) => MyHomePage()));
      //                   },
      //                   child: Text(
      //                     "Hepsini gor",
      //                     textAlign: TextAlign.end,
      //                   )),
      //             ],
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // )),
    );
  }
}
