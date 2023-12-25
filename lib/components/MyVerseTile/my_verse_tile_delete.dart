import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyVerseTileDelete extends StatelessWidget {
  final void Function()? onTap;
  const MyVerseTileDelete({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.cancel,
        color: Color.fromRGBO(56, 129, 172, 1),
      ),
    );
  }
}
