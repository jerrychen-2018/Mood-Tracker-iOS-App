import "package:flutter/material.dart";

class MyMinutes extends StatelessWidget {
  final int mins;
  const MyMinutes({required this.mins, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      (mins < 10) ? '0${mins.toString()}' : mins.toString(),
      style: const TextStyle(
        fontSize: 32,
      ),
    ));
  }
}
