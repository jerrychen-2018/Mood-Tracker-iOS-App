import 'package:ebbnflow/components/MyVerseTile/my_verse_tile_delete.dart';
import 'package:ebbnflow/components/MyVerseTile/my_verse_tile_details.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import "package:flutter/material.dart";

class MyVerseTile extends StatefulWidget {
  final Map<String, dynamic> itemAtIndex;
  const MyVerseTile({super.key, required this.itemAtIndex});

  @override
  State<MyVerseTile> createState() => _MyVerseTileState();
}

class _MyVerseTileState extends State<MyVerseTile> {
  // delete verse block
  void deleteEntry() {
    // show a dialogue box for confirmation
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Delete"),
              content:
                  const Text("Are you sure you want to delete this entry?"),
              actions: [
                // cancel button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                // delete button
                TextButton(
                    onPressed: () {
                      // await SQLHelper.deleteItem(widget.itemAtIndex['id']);
                      Provider.of<Breadify>(context, listen: false)
                          .removeEntryFromList(widget.itemAtIndex['id']);

                      if (!context.mounted) return;
                      Navigator.pop(context);
                    },
                    child: const Text("Delete"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyVerseTileDetails(
                          verseTitle: widget.itemAtIndex['verseTitle'],
                          verse: widget.itemAtIndex['verse'],
                          emotions: widget.itemAtIndex['emotions'],
                          date: widget.itemAtIndex['date'],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[600],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 8,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ]),
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemAtIndex['verseTitle'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          // Text(
                          //   widget.itemAtIndex['verse'],
                          //   style: const TextStyle(fontSize: 12),
                          // ),
                          ReadMoreText(
                            widget.itemAtIndex['verse'],
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' show more',
                            trimExpandedText: '  show less',
                            moreStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            lessStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.itemAtIndex['emotions'],
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.itemAtIndex['date'],
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    MyVerseTileDelete(onTap: deleteEntry)
                  ],
                ),
              ),
            ));
  }
}
