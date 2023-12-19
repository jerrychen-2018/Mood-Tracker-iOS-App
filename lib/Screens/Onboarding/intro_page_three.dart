import "package:flutter/material.dart";

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
          child: Text(
        "Build Habits with Reminders",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
