import 'package:flutter/material.dart';
import "package:ebbnflow/services/sql_helper.dart";

class Breadify extends ChangeNotifier {
  // Future<List<Map<String, dynamic>>> _currentList() async {
  //   final data = await SQLHelper.getItems();
  //   return data;
  // }

  // user scripture list
  List<Map<String, dynamic>> _userEntries = [];

  List<Map<String, dynamic>> kappa = [];

  // get scripture list
  List<Map<String, dynamic>> get userEntries {
    refreshEntries();
    return _userEntries;
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
