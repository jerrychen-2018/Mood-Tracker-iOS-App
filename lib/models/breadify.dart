import 'package:flutter/material.dart';
import "package:ebbnflow/services/sql_helper.dart";

class Breadify extends ChangeNotifier {
  // user scripture list
  List<Map<String, dynamic>> _userEntries = [];

  int _scheduledHour = 7;
  int _scheduledMinute = 30;
  int _scheduledAmPm = 0;

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

  int get scheduledAmPm {
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

  // set Time
  void setHour(int sh) {
    _scheduledHour = sh;
    notifyListeners();
  }

  void setMinutes(int sm) {
    _scheduledMinute = sm;
    notifyListeners();
  }

  void setAmPm(int sap) {
    _scheduledAmPm = sap;
    notifyListeners();
  }
}
