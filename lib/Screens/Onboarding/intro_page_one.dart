import "package:flutter/material.dart";

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
              width: MediaQuery.of(context).size.width * (0.8),
              child: const Text("Breadify = Bread + Edify",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  textAlign: TextAlign.left)),
          const SizedBox(height: 30),
          Container(
              width: MediaQuery.of(context).size.width * (0.8),
              child: const Text(
                  "Let God's very words shape you, your heart, your soul, and your mind. The purpose of this app is to help edify, or establish, your spiritual life, to give you hope when you're feeling alone, and to give you encouragement to keep going when you're on the up.",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  textAlign: TextAlign.left)),
          const SizedBox(height: 30),
          Container(
              width: MediaQuery.of(context).size.width * (0.8),
              child: const Text(
                  "\"Jesus said to them, “I am the bread of life; whoever comes to me shall not hunger, and whoever believes in me shall never thirst.\"",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left)),
          Container(
              width: MediaQuery.of(context).size.width * (0.8),
              child: const Text("-John 6:35 (English Standard Version)",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  textAlign: TextAlign.left)),
          const SizedBox(height: 50),
        ],
      )),
    );
  }
}
