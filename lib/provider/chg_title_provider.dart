import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetTitleBlog extends ChangeNotifier {
  String topTitle = "In love";
  String botTitle = "Days";
  bool topTitleBool = true;
  GetNicknameBloc() {
    getTitle();
  }

  Future<void> updateTitle(String topT, String botT) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (topTitleBool) {
      pref.setString('topT', topT);
    } else {
      pref.setString('botT', botT);
    }
    getTitle();
    notifyListeners();
  }

  getTitle() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    topTitle = pref.getString('topT') ?? topTitle;
    botTitle = pref.getString('botT') ?? botTitle;
  }
}

final chg_title_provider = ChangeNotifierProvider((ref) => GetTitleBlog());
