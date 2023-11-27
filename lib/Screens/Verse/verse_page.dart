import 'package:ebbnflow/components/my_elevated_card.dart';
import 'package:flutter/material.dart';

class VersePage extends StatelessWidget {
  final String verse;
  const VersePage({super.key, required this.verse});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MyElevatedCard(
            text: verse,
          ),
        ]),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
