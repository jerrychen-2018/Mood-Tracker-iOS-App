import 'package:ebbnflow/components/my_verse_tile_delete.dart';
import 'package:flutter/cupertino.dart';
import "package:ebbnflow/services/sql_helper.dart";
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
        builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                  color: Colors.cyan[600],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(7, 5), // changes position of shadow
                    ),
                  ]),
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemAtIndex['verseTitle'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.itemAtIndex['verse'],
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        widget.itemAtIndex['emotions'],
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.itemAtIndex['date'],
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  MyVerseTileDelete(onTap: deleteEntry)
                ],
              ),
            ));

    // Card(
    //             color: Colors.white,
    //             margin: EdgeInsets.all(20),
    //             child: ListTile(
    //               title: Text(listview[index]['verseTitle']),
    //               subtitle: Text(listview[index]['verse'] +
    //                   " " +
    //                   listview[index]['emotions'] +
    //                   " " +
    //                   listview[index]['date']),
    //             ),
    //           ),;
  }
}
