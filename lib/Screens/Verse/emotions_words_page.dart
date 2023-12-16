import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmotionWordsPage extends StatelessWidget {
  const EmotionWordsPage({super.key});
  final List<String> words = const <String>["hi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.xmark),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("emotion words")),
    );
  }
}
