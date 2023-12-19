import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:flutter/material.dart';

class VersePage extends StatelessWidget {
  final String verse;
  final String verseTitle;
  final String emotions;
  final BuildContext parentContext;
  const VersePage(
      {super.key,
      required this.verseTitle,
      required this.verse,
      required this.emotions,
      required this.parentContext});
  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => Container(
              color: Colors.cyan[600],
              padding: EdgeInsets.only(left: 55, right: 55),
              //alignment: Alignment(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            verse,
                            textStyle: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 75),
                          ),
                        ],
                        totalRepeatCount: 4,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ]),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime now = DateTime.now();
                      String formattedDate =
                          DateFormat.yMMMMd('en_US').add_jm().format(now);
                      // await SQLHelper.createItem(
                      //     verseTitle, verse, formattedDate, emotions);
                      Provider.of<Breadify>(context, listen: false)
                          .addEntryToList(
                              verseTitle, verse, formattedDate, emotions);

                      if (!context.mounted) return;
                      Navigator.of(parentContext).pop();
                    },
                    child: const Text('Exit'),
                  ),
                ],
              ),
            ));
  }
}
