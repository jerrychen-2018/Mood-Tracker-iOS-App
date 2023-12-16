import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmotionWordsPage extends StatefulWidget {
  const EmotionWordsPage({super.key});

  @override
  State<EmotionWordsPage> createState() => _EmotionWordsPageState();
}

class _EmotionWordsPageState extends State<EmotionWordsPage> {
  //final List<String> words = const <String>["Fear", "Anger", "Lonely", "Sad"];
  List<String> addedWords = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.xmark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "What words best describe",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(
              "how you're feeling today?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        fearIsPressed = !fearIsPressed;
                        if (fearIsPressed) {
                          addedWords.add("Fear");
                        } else {
                          addedWords.removeWhere((string) => string == "Fear");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Fear")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        lonelyIsPressed = !lonelyIsPressed;
                        if (lonelyIsPressed) {
                          addedWords.add("Lonely");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Lonely");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Lonely")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        gratitudeIsPressed = !gratitudeIsPressed;
                        if (gratitudeIsPressed) {
                          addedWords.add("Gratitude");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Gratitude");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Gratitude"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        encouragedIsPressed = !encouragedIsPressed;
                        if (encouragedIsPressed) {
                          addedWords.add("Encouraged");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Encouraged");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Encouraged")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        angryIsPressed = !angryIsPressed;
                        if (angryIsPressed) {
                          addedWords.add("Angry");
                        } else {
                          addedWords.removeWhere((string) => string == "Angry");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Angry")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        joyfulIsPressed = !joyfulIsPressed;
                        if (joyfulIsPressed) {
                          addedWords.add("Joyful");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Joyful");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Joyful"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        confusedIsPressed = !confusedIsPressed;
                        if (confusedIsPressed) {
                          addedWords.add("Confused");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Confused");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Confused")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        worriedIsPressed = !worriedIsPressed;
                        if (worriedIsPressed) {
                          addedWords.add("Worried");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Worried");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Worried")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        hopefulIsPressed = !hopefulIsPressed;
                        if (hopefulIsPressed) {
                          addedWords.add("Hopeful");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Hopeful");
                        }
                        // for testing purposes
                        print(addedWords.toString());
                      });
                    },
                    child: Text("Hopeful"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        enviousIsPressed = !enviousIsPressed;
                        if (enviousIsPressed) {
                          addedWords.add("Envious");
                        } else {
                          addedWords
                              .removeWhere((string) => string == "Envious");
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
                        backgroundColor:
                            otherIsPressed ? Colors.lightBlue : Colors.white),
                    onPressed: () {
                      setState(() {
                        otherIsPressed = !otherIsPressed;
                        if (otherIsPressed) {
                          addedWords.add("Other");
                        } else {
                          addedWords.removeWhere((string) => string == "Other");
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
            TextButton(
                onPressed: () {},
                child: FaIcon(FontAwesomeIcons.circleArrowRight)),
          ],
        ),
      ),
    );
  }
}