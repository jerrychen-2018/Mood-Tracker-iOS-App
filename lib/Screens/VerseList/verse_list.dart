import "package:ebbnflow/components/my_elevated_card.dart";
import "package:flutter/material.dart";

class VerseList extends StatelessWidget {
  const VerseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scripture List"),
        leading: null,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your List",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              MyElevatedCard(text: "Verse One"),
              MyElevatedCard(text: "Verse Two"),
              MyElevatedCard(text: "Verse Three"),
              MyElevatedCard(text: "Verse Four"),
              MyElevatedCard(text: "Verse Five"),
              MyElevatedCard(text: "Verse Six"),
              MyElevatedCard(text: "Verse Seven"),
              MyElevatedCard(text: "Verse Eight"),
              MyElevatedCard(text: "Verse Nine"),
            ],
          ),
        ),
      )),
    );
  }
}
