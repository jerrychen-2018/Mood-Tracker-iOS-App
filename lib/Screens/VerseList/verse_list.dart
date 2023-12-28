import "package:ebbnflow/components/MyVerseTile/my_verse_tile.dart";
import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import "package:flutter/material.dart";

class VerseList extends StatefulWidget {
  const VerseList({super.key});

  @override
  State<VerseList> createState() => _VerseListState();
}

class _VerseListState extends State<VerseList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: const Text("Your Scripture List 🙏",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
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
                    (value.userEntries.isEmpty)
                        ? Center(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.5),
                                const Text(
                                  "Add your first verse!",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text("Tap the big PLUS button",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                const Text(
                                  "👇",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.userEntries.length,
                            itemBuilder: (context, index) => MyVerseTile(
                                itemAtIndex: value.userEntries[index])),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ));
  }
}
