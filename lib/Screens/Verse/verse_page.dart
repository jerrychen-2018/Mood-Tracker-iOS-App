import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class VersePage extends StatelessWidget {
  final String verse;
  final BuildContext parentContext;
  const VersePage(
      {super.key, required this.verse, required this.parentContext});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: const Alignment(0.0, 0.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              verse,
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        MaterialButton(
          onPressed: () => Navigator.of(parentContext).pop(),
          child: Text('Exit'),
        )
      ]),
    );
  }
}
