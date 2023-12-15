import "package:flutter/material.dart";

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight / 2,
            color: Colors.green.shade300,
          ),
          Container(
            height: constraints.maxHeight / 2,
            //color: Colors.white,
          ),
        ],
      );
    });
  }
}
