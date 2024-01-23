// import 'dart:io';

// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';

// class HiveServices {
//   static Future<void> initHive() async {
//     final dic = await getApplicationDocumentsDirectory();
//     Hive.init(dic.path);
//   }

//   static getUserBox(String boxName, int key) async {
//     final box = await Hive.box(boxName);
//     return box.get(key);
//   }

//   static storeData(String boxName, int key, File data) async {
//     final box = await Hive.box(boxName);
//     box.put(key, data);
//   }

//   static deleteDate(String boxName, int key) async {
//     final box = await Hive.box(boxName);
//     box.delete(key);
//   }
// }
