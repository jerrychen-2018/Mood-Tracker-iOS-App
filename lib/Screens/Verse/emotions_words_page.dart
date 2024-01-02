import 'dart:convert';
import 'package:ebbnflow/Screens/Verse/verse_page.dart';
import "package:flutter/material.dart";
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class EmotionWordsPage extends StatefulWidget {
  const EmotionWordsPage({Key? key}) : super(key: key);

  @override
  State<EmotionWordsPage> createState() => _EmotionWordsPageState();
}

class _EmotionWordsPageState extends State<EmotionWordsPage> {
  List<String> addedWords = [];
  int numChosen = 0;
  bool fearIsPressed = false;
  bool lonelyIsPressed = false;
  bool gratitudeIsPressed = false;
  bool discouragedIsPressed = false;
  bool angryIsPressed = false;
  bool joyfulIsPressed = false;
  bool confusedIsPressed = false;
  bool worriedIsPressed = false;
  bool hopefulIsPressed = false;
  bool enviousIsPressed = false;
  bool disappointedIsPressed = false;
  bool otherIsPressed = false;
  String finalVerseTitle = "";
  String finalVerse = "";

  void noWordsMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
            title: const Text("Error"),
            content: const Text("Please choose at least one word."),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Done',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary)),
              )
            ]);
      },
    );
  }

  void resetWords() {
    setState(() {
      if (fearIsPressed) {
        fearIsPressed = false;
        addedWords.removeWhere((string) => string == "Fear");
      }

      if (lonelyIsPressed) {
        lonelyIsPressed = false;
        addedWords.removeWhere((string) => string == "Lonely");
      }

      if (gratitudeIsPressed) {
        gratitudeIsPressed = false;
        addedWords.removeWhere((string) => string == "Gratitude");
      }

      if (discouragedIsPressed) {
        discouragedIsPressed = false;
        addedWords.removeWhere((string) => string == "Discouraged");
      }

      if (angryIsPressed) {
        angryIsPressed = false;
        addedWords.removeWhere((string) => string == "Angry");
      }

      if (joyfulIsPressed) {
        joyfulIsPressed = false;
        addedWords.removeWhere((string) => string == "Joyful");
      }

      if (confusedIsPressed) {
        confusedIsPressed = false;
        addedWords.removeWhere((string) => string == "Confused");
      }

      if (worriedIsPressed) {
        worriedIsPressed = false;
        addedWords.removeWhere((string) => string == "Worried");
      }

      if (hopefulIsPressed) {
        hopefulIsPressed = false;
        addedWords.removeWhere((string) => string == "Hopeful");
      }

      if (enviousIsPressed) {
        enviousIsPressed = false;
        addedWords.removeWhere((string) => string == "Envious");
      }

      if (disappointedIsPressed) {
        disappointedIsPressed = false;
        addedWords.removeWhere((string) => string == "Disappointed");
      }

      if (otherIsPressed) {
        otherIsPressed = false;
        addedWords.removeWhere((string) => string == "Other");
      }
    });
  }

  @override
  Widget build(BuildContext rootContext) {
    return Material(
        child: Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context2) => Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const FaIcon(FontAwesomeIcons.xmark),
                onPressed: () => Navigator.of(rootContext).pop(),
              ),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "What words best describe",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const Text(
                      "how you're feeling now?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: fearIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                fearIsPressed = !fearIsPressed;
                                if (fearIsPressed) {
                                  addedWords.add("Fear");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Fear");
                                }
                              });
                            },
                            child: Text("Fear",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: lonelyIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                lonelyIsPressed = !lonelyIsPressed;
                                if (lonelyIsPressed) {
                                  addedWords.add("Lonely");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Lonely");
                                }
                              });
                            },
                            child: Text("Lonely",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: gratitudeIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                gratitudeIsPressed = !gratitudeIsPressed;
                                if (gratitudeIsPressed) {
                                  addedWords.add("Gratitude");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Gratitude");
                                }
                              });
                            },
                            child: Text("Gratitude",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: discouragedIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                discouragedIsPressed = !discouragedIsPressed;
                                if (discouragedIsPressed) {
                                  addedWords.add("Discouraged");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Discouraged");
                                }
                              });
                            },
                            child: Text("Discouraged",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: angryIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                angryIsPressed = !angryIsPressed;
                                if (angryIsPressed) {
                                  addedWords.add("Angry");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Angry");
                                }
                              });
                            },
                            child: Text("Angry",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: joyfulIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                joyfulIsPressed = !joyfulIsPressed;
                                if (joyfulIsPressed) {
                                  addedWords.add("Joyful");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Joyful");
                                }
                              });
                            },
                            child: Text("Joyful",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: confusedIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                confusedIsPressed = !confusedIsPressed;
                                if (confusedIsPressed) {
                                  addedWords.add("Confused");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Confused");
                                }
                              });
                            },
                            child: Text("Confused",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: worriedIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                worriedIsPressed = !worriedIsPressed;
                                if (worriedIsPressed) {
                                  addedWords.add("Worried");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Worried");
                                }
                              });
                            },
                            child: Text("Worried",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: hopefulIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                hopefulIsPressed = !hopefulIsPressed;
                                if (hopefulIsPressed) {
                                  addedWords.add("Hopeful");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Hopeful");
                                }
                              });
                            },
                            child: Text("Hopeful",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: enviousIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                enviousIsPressed = !enviousIsPressed;
                                if (enviousIsPressed) {
                                  addedWords.add("Envious");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Envious");
                                }
                              });
                            },
                            child: Text("Envious",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: disappointedIsPressed
                                    ? Colors.lightBlue
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                disappointedIsPressed = !disappointedIsPressed;
                                if (disappointedIsPressed) {
                                  addedWords.add("Disappointed");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Disappointed");
                                }
                              });
                            },
                            child: Text("Disappointed",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary))),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: otherIsPressed
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              setState(() {
                                otherIsPressed = !otherIsPressed;
                                if (otherIsPressed) {
                                  addedWords.add("Other");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Other");
                                }
                              });
                            },
                            child: Text("Other",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Submit Button
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Theme.of(context).colorScheme.secondary),
                          ),
                          onPressed: () async {
                            if (addedWords.isEmpty) {
                              noWordsMessage();
                            } else {
                              // HTTP Request

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });

                              const url = 'http://18.144.43.39';

                              var response = await http.post(Uri.parse(url),
                                  body: json.encode(
                                      {'emotions': addedWords.toString()}));
                              response = await http.get(Uri.parse(url));
                              final decoded = jsonDecode(response.body)
                                  as Map<String, dynamic>;
                              //final decoded = json.decode(response.body) as Map<String, dynamic>;

                              finalVerseTitle = decoded['verseTitle'];
                              finalVerse = decoded['verse'];
                              Navigator.of(context, rootNavigator: true).pop();

                              if (!context.mounted) return;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CupertinoPageScaffold(
                                      navigationBar:
                                          const CupertinoNavigationBar(),
                                      child: VersePage(
                                        verseTitle: finalVerseTitle,
                                        verse: finalVerse,
                                        emotions: addedWords.toString(),
                                        parentContext: rootContext,
                                      )),
                                ),
                              );
                            }
                          },
                          child: const Row(
                            children: [
                              Text("See Verse"),
                              Gap(10),
                              FaIcon(FontAwesomeIcons.circleArrowRight)
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
