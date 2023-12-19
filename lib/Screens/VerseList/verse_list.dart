import "package:ebbnflow/components/my_elevated_card.dart";
import "package:ebbnflow/services/sql_helper.dart";
import "package:ebbnflow/Screens/Verse/emotions_words_page.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import "package:flutter/material.dart";

class VerseList extends StatefulWidget {
  const VerseList({super.key});

  @override
  State<VerseList> createState() => _VerseListState();
}

class _VerseListState extends State<VerseList> {
  List<Map<String, dynamic>> listview = [];

  bool _isLoading = true;

  void addVerse() async {
    final result = await showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => const EmotionWordsPage());
    _refreshListView();
    print("...number of items ${listview.length}");
  }

  void _refreshListView() async {
    final data = await SQLHelper.getItems();
    setState(() {
      listview = data;
      _isLoading = false;
    });
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
  }

  // String emotionsToString()

  @override
  void initState() {
    super.initState();
    _refreshListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scripture List"),
        leading: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              "Your List",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listview.length,
              itemBuilder: (context, index) => Card(
                color: Colors.white,
                margin: EdgeInsets.all(20),
                child: ListTile(
                  title: Text(listview[index]['verseTitle']),
                  subtitle: Text(listview[index]['verse'] +
                      " " +
                      listview[index]['emotions'] +
                      " " +
                      listview[index]['date']),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addVerse,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
