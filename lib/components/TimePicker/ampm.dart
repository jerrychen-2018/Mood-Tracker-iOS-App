import "package:flutter/material.dart";

class AmPm extends StatelessWidget {
  final bool isItAm;
  const AmPm({required this.isItAm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      isItAm == true ? 'AM' : 'PM',
      style: const TextStyle(fontSize: 32),
    ));
  }
}
