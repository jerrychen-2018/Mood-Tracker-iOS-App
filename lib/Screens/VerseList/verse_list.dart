import "package:ebbnflow/components/my_verse_tile.dart";
import "package:ebbnflow/Screens/Verse/emotions_words_page.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import "package:flutter/material.dart";

class VerseList extends StatefulWidget {
  const VerseList({super.key});

  @override
  State<VerseList> createState() => _VerseListState();
}

class _VerseListState extends State<VerseList> {
  //List<Map<String, dynamic>> listview = [];

  Future<void> addVerse() async {
    final result = await showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => const EmotionWordsPage());

    // print("...number of items ${listview.length}");
    // print("...items ${listview.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: const Text("Your Scripture List",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // AnimatedList(
                      //     shrinkWrap: true,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     initialItemCount: listview.length,
                      //     itemBuilder: (context, index, animation) => MyVerseTile(
                      //           itemAtIndex: listview[index],
                      //           animation: animation,
                      //         )),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.userEntries.length,
                          itemBuilder: (context, index) => MyVerseTile(
                              itemAtIndex: value.userEntries[index]))
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: addVerse,
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndFloat,
            ));
  }
}
