import "package:flutter/material.dart";

class MyHours extends StatelessWidget {
  final int hrs;
  const MyHours({required this.hrs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      (hrs + 1).toString(),
      style: const TextStyle(fontSize: 32),
    ));
  }
}
