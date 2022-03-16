


import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String getBuildVariant(){
    if(kReleaseMode){
      return ".env.production";
    }
    else if(kDebugMode){
      return ".env.development";
    } else return ".env";
  }

  static get baseURL {
    return dotenv.env["BASE_URL"];
  }

  static get token {
    return dotenv.env["TOKEN"];
  }
}