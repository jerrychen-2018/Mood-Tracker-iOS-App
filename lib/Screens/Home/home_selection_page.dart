import 'package:ebbnflow/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class HomeSelectionPage extends StatelessWidget {
  final String emoji;

  const HomeSelectionPage({super.key, required this.emoji});

  List emotionWords(String emotion) {
    var words = <String>[];

    if (emotion == "😀") {
      words.addAll(["Joy", "Encouragement", "Gratitude", "Love", "Hope"]);
    }
    if (emotion == "😐") {
      words.addAll(['Average', 'Indifferent']);
    }
    if (emotion == "😕") {
      words.addAll(
          ["Loneliness", "Anger", "Guilt", "Shame", "Worry", "Confusion"]);
    }

    return words;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (var i in emotionWords(emoji)) Text(i.toString())]),
    );
  }
}
