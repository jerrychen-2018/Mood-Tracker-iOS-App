import 'dart:convert';

import 'package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:ebbnflow/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class HomeSelectionPage extends StatefulWidget {
  final String emoji;

  const HomeSelectionPage({super.key, required this.emoji});

  @override
  State<HomeSelectionPage> createState() => _HomeSelectionPageState();
}

class _HomeSelectionPageState extends State<HomeSelectionPage> {
  String finalResponse = "";
  List emotionWords(String emotion) {
    var words = <String>[];

    if (emotion == "😀") {
      words.addAll(["Joy", "Encouragement", "Gratitude", "Love", "Hope"]);
    }
    if (emotion == "😐") {
      words.addAll(['Average', 'Indifferent']);
    }
    if (emotion == "😢") {
      words.addAll([
        "Fear",
        "Loneliness",
        "Anger",
        "Guilt",
        "Shame",
        "Worry",
        "Confusion"
      ]);
    }

    return words;
  }

  void goBack() {
    Navigator.pop(context);
  }

  void getVerse() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Words"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //MyButton(onTap: goBack, text: "Back"),
          for (var i in emotionWords(widget.emoji))
            OutlinedButton(
              onPressed: () async {
                const url = "http://127.0.0.1:5000/";
                final response = await http.get(Uri.parse(url));
                final decoded =
                    jsonDecode(response.body) as Map<String, dynamic>;

                setState(() {
                  finalResponse = decoded['verse'];
                });
              },
              style: OutlinedButton.styleFrom(foregroundColor: Colors.amber),
              child: Text(i.toString()),
            ),
          const Gap(3),
          MyButton(onTap: getVerse, text: "Submit"),
        ]),
      ),
    );
  }
}
