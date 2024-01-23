import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class DatePickerBloc extends ChangeNotifier {
  DateTime now = DateTime.now();
  int dayDifference = 0;
  int waveHeight = 0;
  Future<void> pickDateFromCalendar(BuildContext context) async {
    final pickDateTime = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        initialDate: DateTime.now());
    if (pickDateTime != null) {
      final formattedString = DateFormat('yyyy-MM-dd').format(pickDateTime);
      final pickDate = DateFormat('yyyy-MM-dd').parse(formattedString);
      dayDifference = now.difference(pickDate).inDays;
      if (dayDifference > 100) {
        waveHeight = dayDifference % 100;
      } else {
        waveHeight = dayDifference;
      }
    }
    notifyListeners();
  }
}

final datePickerProvider = ChangeNotifierProvider((ref) => DatePickerBloc());
