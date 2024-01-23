import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class GetImageOne extends ChangeNotifier {
  File? fileImageOne;
  File? cropImageOne;
  bool gallery = true;
  GetImageOne() {
    getImageOneFromHive();
  }
  Future getImagePickerOne() async {
    XFile? xfileImage = gallery
        ? await ImagePicker().pickImage(source: ImageSource.gallery)
        : await ImagePicker().pickImage(source: ImageSource.camera);
    if (xfileImage != null) {
      // cropImageOne = null;
      fileImageOne = File(xfileImage.path);
      cropImage();
    }
    notifyListeners();
  }

  Future<void> saveImageToHive(File imageFile, String boxName, int keyy) async {
    final imageBytes = await imageFile.readAsBytes();
    final box = await Hive.openBox(boxName);
    if (box.isNotEmpty) {
      box.clear();
    }

    await box.put(keyy, imageBytes);
    notifyListeners();
  }

  Future<void> getImageOneFromHive() async {
    final box = await Hive.openBox('box_one');
    final imageData = box.get(1) as List<int>?;
    // await box.close();
    if (imageData != null) {
      final file = File(
          '${(await getTemporaryDirectory()).path}/retrieved_image_one.jpg');
      await file.writeAsBytes(imageData);

      cropImageOne = file;
    }
    notifyListeners();
  }

  Future<void> cropImage() async {
    if (fileImageOne != null) {
      final cropImageFile = await ImageCropper().cropImage(
        sourcePath: fileImageOne!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop your image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      );
      if (cropImageFile != null) {
        cropImageOne = cropImageFile;
        saveImageToHive(cropImageOne!, 'box_one', 1);
        notifyListeners();
      }
    }
  }
}

final providerImgOne = ChangeNotifierProvider((ref) => GetImageOne());

class GetImageTwo extends ChangeNotifier {
  File? fileImageTwo;
  File? cropImageTwo;
  bool gallery = true;
  GetImageTwo() {
    getImageTwoFromHive();
  }
  Future getImagePickerTwo() async {
    XFile? xfileImage = gallery
        ? await ImagePicker().pickImage(source: ImageSource.gallery)
        : await ImagePicker().pickImage(source: ImageSource.camera);
    if (xfileImage != null) {
      // cropImageTwo = null;
      fileImageTwo = File(xfileImage.path);
      cropImage();
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

  Future<void> getImageTwoFromHive() async {
    final box = await Hive.openBox('box_Two');
    final imageData = box.get(1) as List<int>?;
    await box.close();
    if (imageData != null) {
      final file = File(
          '${(await getTemporaryDirectory()).path}/retrieved_image_Two.jpg');
      await file.writeAsBytes(imageData);
      cropImageTwo = file;
    }
    notifyListeners();
  }

  Future<void> cropImage() async {
    if (fileImageTwo != null) {
      final cropImageFile = await ImageCropper().cropImage(
        sourcePath: fileImageTwo!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      );
      if (cropImageFile != null) {
        cropImageTwo = cropImageFile;
        saveImageToHive(cropImageTwo!, 'box_Two', 1);
        notifyListeners();
      }
    }
  }
}

final providerImgTwo = ChangeNotifierProvider((ref) => GetImageTwo());
