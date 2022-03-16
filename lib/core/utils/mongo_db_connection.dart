//
//
// import 'dart:io';
//
// import 'package:mongo_dart/mongo_dart.dart';
//
// class MongoDBConnection {
//   MongoDBConnection._internal();
//   static final MongoDBConnection instance = MongoDBConnection._internal();
//
//   final String _host = "0.0.0.0";
//   final String _port = "27017";
//   final String _dbName = "mongodeneme";
//   Db? _db;
//
//   Future<Db> getConnection() async{
//     if (_db == null){
//       try {
//         _db = Db("mongodb://mongoadmin.4238844:mongoadmin.4238844@192.168.1.24:27017/mongodeneme?authSource=admin");
//         await _db!.open();
//       } catch(e){
//         print(e);
//       }
//     }
//     return _db!;
//   }
//
//   closeConnection() {
//     _db!.close();
//   }
// }