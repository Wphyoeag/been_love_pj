import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChgWallpaperBloc extends ChangeNotifier {
  String? wallpaperImage;
  File? wallpaperImgFile;
  bool gallery = true;
  ChgWallpaperBloc() {
    getWallpaper();
    getImageFileFromHive();
  }
  Future<void> showImagePicker() async {
    XFile? imageXFile = gallery
        ? await ImagePicker().pickImage(source: ImageSource.gallery)
        : await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageXFile != null) {
      wallpaperImgFile = null;
      final imgFile = File(imageXFile.path);
      await saveImageToHive(imgFile, 'wallpp', 1);
      wallpaperImage = null;
      await getImageFileFromHive();
    }
    notifyListeners();
  }

  Future<void> saveImageToHive(File imageFile, String boxName, int keyy) async {
    final imageBytes = await imageFile.readAsBytes();
    final box = await Hive.openBox(boxName);
    box.clear();
    await box.put(keyy, imageBytes);
    await box.close();
    notifyListeners();
  }

  Future<void> getImageFileFromHive() async {
    final box = await Hive.openBox('wallpp');
    final imageData = box.get(1) as List<int>?;
    await box.close();
    if (imageData != null) {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file =
          File('${(await getTemporaryDirectory()).path}/${timestamp}.jpg');
      await file.writeAsBytes(imageData);
      wallpaperImgFile = file;
    }
    notifyListeners();
  }

  Future<void> storeWallpaper(String wallppImage) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('wallppImage', wallppImage);
    getWallpaper();
    wallpaperImgFile = null;
    notifyListeners();
  }

  Future<void> getWallpaper() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    wallpaperImage = pref.getString('wallppImage');
    pref.remove('wallppImage');
    notifyListeners();
  }
}

final chgWallpaperProvider =
    ChangeNotifierProvider((ref) => ChgWallpaperBloc());
