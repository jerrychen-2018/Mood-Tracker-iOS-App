import "package:flutter/material.dart";

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight / 2,
            color: Colors.red,
          ),
          Container(
            height: constraints.maxHeight / 2,
            //color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("Hello"),
            ),
          ),
        ],
      );
    });
  }
}
