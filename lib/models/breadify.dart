import 'package:flutter/material.dart';
import "package:ebbnflow/services/sql_helper.dart";

class Breadify extends ChangeNotifier {
  // user scripture list
  List<Map<String, dynamic>> _userEntries = [];

  int _scheduledHour = 0;
  int _scheduledMinute = 0;
  bool _scheduledAmPm = true;

  // get scripture list
  List<Map<String, dynamic>> get userEntries {
    refreshEntries();
    return _userEntries;
  }

  // get scheduled time, if any
  int get scheduledHour {
    return _scheduledHour;
  }

  int get scheduledMinute {
    return _scheduledMinute;
  }

  bool get scheduledAmPm {
    return _scheduledAmPm;
  }

  Future<void> refreshEntries() async {
    final data = await SQLHelper.getItems();
    _userEntries = data;
    notifyListeners();
  }

  // add entry to scripture list
  Future<void> addEntryToList(
      String verseTitle, String verse, String date, String emotions) async {
    await SQLHelper.createItem(verseTitle, verse, date, emotions);
    notifyListeners();
  }

  // remove entry from scripture list

  Future<void> removeEntryFromList(int id) async {
    await SQLHelper.deleteItem(id);
    notifyListeners();
  }
}
