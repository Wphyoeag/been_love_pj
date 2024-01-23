import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetNicknameBloc extends ChangeNotifier {
  String name_one = "Wai Phyo Aung";
  String name_two = "Kyawt Kay Khaing";
  bool nnOne = true;
  GetNicknameBloc() {
    getNickName();
  }
  Future<void> updateNickmame(String nn_one, String nn_two) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (nnOne) {
      pref.setString('nn_one', nn_one);
    } else {
      pref.setString('nn_two', nn_two);
    }
    getNickName();
    notifyListeners();
  }

  getNickName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    name_one = pref.getString('nn_one') ?? name_one;
    name_two = pref.getString('nn_two') ?? name_two;
  }
}

final nn_provider = ChangeNotifierProvider((ref) => GetNicknameBloc());
