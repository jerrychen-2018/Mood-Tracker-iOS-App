import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // this size provides total width and height of our screen
    return Container(
      height: size.height,
      width: double.infinity,
    );
  }
}
