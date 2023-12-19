import 'package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmotionWordsPageOnboard extends StatefulWidget {
  const EmotionWordsPageOnboard({super.key});

  @override
  State<EmotionWordsPageOnboard> createState() => _EmotionWordsPageState();
}

class _EmotionWordsPageState extends State<EmotionWordsPageOnboard> {
  //final List<String> words = const <String>["Fear", "Anger", "Lonely", "Sad"];
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
          onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
              (route) => false),
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
                OutlinedButton(onPressed: () {}, child: const Text("Fear")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(onPressed: () {}, child: const Text("Lonely")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(onPressed: () {}, child: const Text("Gratitude"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text("Encouraged")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(onPressed: () {}, child: const Text("Angry")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(onPressed: () {}, child: const Text("Joyful"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text("Confused")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(onPressed: () {}, child: const Text("Worried")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(onPressed: () {}, child: const Text("Hopeful"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text("Envious")),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {}, child: const Text("Disappointed")),
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
                      });
                    },
                    child: const Text("Other"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
