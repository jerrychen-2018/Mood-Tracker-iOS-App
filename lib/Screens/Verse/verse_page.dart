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
        builder: (context, value, child) => SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      verseTitle,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 300,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  verse,
                                  textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  speed: const Duration(milliseconds: 75),
                                ),
                              ],
                              totalRepeatCount: 1,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime now = DateTime.now();
                        String formattedDate =
                            DateFormat.yMMMMd('en_US').add_jm().format(now);

                        Provider.of<Breadify>(context, listen: false)
                            .addEntryToList(
                                verseTitle, verse, formattedDate, emotions);

                        if (!context.mounted) return;
                        Navigator.of(parentContext).pop();
                      },
                      child: const Text('Done'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ));
  }
}
