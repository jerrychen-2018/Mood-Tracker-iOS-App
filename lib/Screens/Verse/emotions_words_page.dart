import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ebbnflow/Screens/Verse/verse_page.dart';
import "package:flutter/material.dart";
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class EmotionWordsPage extends StatefulWidget {
  const EmotionWordsPage({Key? key}) : super(key: key);

  @override
  State<EmotionWordsPage> createState() => _EmotionWordsPageState();
}

class _EmotionWordsPageState extends State<EmotionWordsPage> {
  //final List<String> words = const <String>["Fear", "Anger", "Lonely", "Sad"];
  List<String> addedWords = [];
  int numChosen = 0;
  bool fearIsPressed = false;
  bool lonelyIsPressed = false;
  bool gratitudeIsPressed = false;
  bool encouragedIsPressed = false;
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
        return const AlertDialog(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'No words were chosen, please choose at least 1 word.',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
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
                      "how you're feeling today?",
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
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                fearIsPressed = !fearIsPressed;
                                if (fearIsPressed) {
                                  addedWords.add("Fear");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Fear");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Fear")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: lonelyIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                lonelyIsPressed = !lonelyIsPressed;
                                if (lonelyIsPressed) {
                                  addedWords.add("Lonely");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Lonely");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Lonely")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: gratitudeIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                gratitudeIsPressed = !gratitudeIsPressed;
                                if (gratitudeIsPressed) {
                                  addedWords.add("Gratitude");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Gratitude");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Gratitude"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: encouragedIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                encouragedIsPressed = !encouragedIsPressed;
                                if (encouragedIsPressed) {
                                  addedWords.add("Encouraged");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Encouraged");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Encouraged")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: angryIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                angryIsPressed = !angryIsPressed;
                                if (angryIsPressed) {
                                  addedWords.add("Angry");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Angry");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Angry")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: joyfulIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                joyfulIsPressed = !joyfulIsPressed;
                                if (joyfulIsPressed) {
                                  addedWords.add("Joyful");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Joyful");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Joyful"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: confusedIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                confusedIsPressed = !confusedIsPressed;
                                if (confusedIsPressed) {
                                  addedWords.add("Confused");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Confused");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Confused")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: worriedIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                worriedIsPressed = !worriedIsPressed;
                                if (worriedIsPressed) {
                                  addedWords.add("Worried");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Worried");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Worried")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: hopefulIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                hopefulIsPressed = !hopefulIsPressed;
                                if (hopefulIsPressed) {
                                  addedWords.add("Hopeful");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Hopeful");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Hopeful"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: enviousIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                enviousIsPressed = !enviousIsPressed;
                                if (enviousIsPressed) {
                                  addedWords.add("Envious");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Envious");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Envious")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: disappointedIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                disappointedIsPressed = !disappointedIsPressed;
                                if (disappointedIsPressed) {
                                  addedWords.add("Disappointed");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Disappointed");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Disappointed")),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: otherIsPressed
                                    ? Colors.lightBlue
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                otherIsPressed = !otherIsPressed;
                                if (otherIsPressed) {
                                  addedWords.add("Other");
                                } else {
                                  addedWords.removeWhere(
                                      (string) => string == "Other");
                                }
                                // for testing purposes
                                print(addedWords.toString());
                              });
                            },
                            child: const Text("Other"))
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
                          onPressed: () async {
                            if (!fearIsPressed &&
                                !joyfulIsPressed &&
                                !lonelyIsPressed &&
                                !gratitudeIsPressed &&
                                !encouragedIsPressed &&
                                !angryIsPressed &&
                                !confusedIsPressed &&
                                !worriedIsPressed &&
                                !hopefulIsPressed &&
                                !enviousIsPressed &&
                                !disappointedIsPressed &&
                                !otherIsPressed) {
                              noWordsMessage();
                            } else {
                              // HTTP Request
                              const url = 'http://127.0.0.1:5000/';
                              var response = await http.post(Uri.parse(url),
                                  body: json.encode(
                                      {'emotions': addedWords.toString()}));
                              response = await http.get(Uri.parse(url));
                              final decoded = json.decode(response.body)
                                  as Map<String, dynamic>;
                              finalVerseTitle = decoded['verseTitle'];
                              finalVerse = decoded['verse'];

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
