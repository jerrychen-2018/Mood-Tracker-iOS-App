import 'package:flutter/material.dart';

class MyElevatedCard extends StatelessWidget {
  final String text;
  MyElevatedCard({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: 300,
          height: 350,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(text),
            ),
          )),
    );
  }
}
