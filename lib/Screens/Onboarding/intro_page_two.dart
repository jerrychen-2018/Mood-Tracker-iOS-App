import 'package:ebbnflow/components/my_time_picker_button.dart';

import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class IntroPageTwo extends StatefulWidget {
  const IntroPageTwo({super.key});

  @override
  State<IntroPageTwo> createState() => _IntroPageTwoState();
}

class _IntroPageTwoState extends State<IntroPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
      builder: (context, value, child) => SafeArea(
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
                width: MediaQuery.of(context).size.width * (0.8),
                child: const Text(
                    "What's the best time of day to receive a nudge?",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    textAlign: TextAlign.left)),
            const SizedBox(height: 50),
            const MyTimePickerButton(),
          ],
        )),
      ),
    );
  }
}

// Center(
//                   child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                       width: MediaQuery.of(context).size.width * (0.8),
//                       child: const Text(
//                           "What is your toughest time of day when you could use some extra encouragement?",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center)),
//                   MyTimePickerButton(),
//                 ],
//               )),
