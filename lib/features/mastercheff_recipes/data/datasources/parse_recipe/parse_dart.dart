import 'package:master_chef_yemek_tarifleri/features/mastercheff_recipes/data/models/recipe_model.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';



// Future<void> initParse() async {
//   const keyApplicationId = 'aIdalP1zd7SPD9jbog7zs9p6k7tLp7zgRx0q6C8B';
//   const keyClientKey = 'dcagschykIghBu7HoYaF78n9KGdtuh6JgziP5pBg';
//   const keyParseServerUrl = 'https://parseapi.back4app.com';
//
//   await Parse().initialize(keyApplicationId, keyParseServerUrl,
//     clientKey: keyClientKey, autoSendSessionId: true, );
// }
//
// void _incrementCounter() async {
//   final ParseCloudFunction function = ParseCloudFunction('removeInvalidLogin');
//   final ParseResponse parseResponse = await function.execute();
//   print(" error ${parseResponse.error?.message}");
//   if (parseResponse.success && parseResponse.result != null) {
//     print(parseResponse.result);
//   }
// }
//
// Future<void> saveRecipe(RecipeModel element) async {
//
//   var recipe = ParseObject("mastercheff_recipes");
//   recipe.set("RecipeId", element.id);
//   recipe.set("eski_id", element.eskiId);
//   recipe.set("seo_baslik", element.seoBaslik);
//   recipe.set("baslik_orig", element.baslikOrig);
//   recipe.set("baslik", element.baslik);
//   recipe.set("spot", element.spot);
//   recipe.set("slug", element.slug);
//   recipe.set("yerlesim_id", element.yerlesimId);
//   recipe.set("kategori_id", element.kategoriId);
//   recipe.set("anasayfa", element.anasayfa);
//   recipe.set("okunma", element.okunma);
//   recipe.set("tip", element.tip);
//   recipe.set("tip_deger", element.tipDeger);
//   recipe.set("detay", element.detay);
//   recipe.set("guncelleme_tarihi", element.guncellemeTarihi);
//   recipe.set("durum", element.durum);
//   recipe.set("anasayfa_class_adi", element.anasayfaClassAdi);
//   recipe.set("resim", element.resim);
//   recipe.set("video_suresi", element.videoSuresi);
//   recipe.set("anasayfa_dikey_foto", element.anasayfaDikeyFoto);
//   recipe.set("kayit_tarihi", element.kayitTarihi);
//   recipe.set("kslug", element.kslug);
//   recipe.set("kname", element.kname);
//   recipe.set("yayinlanma_tarihi", element.yayinlanmaTarihi);
//   await recipe.save();
// }