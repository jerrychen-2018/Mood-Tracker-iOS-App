import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppleAltSignIn extends StatelessWidget {
  final String imagePath;
  const AppleAltSignIn({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 54,
      padding: const EdgeInsets.only(left: 41, right: 40),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          const BoxShadow(
            color: Color(0x2A000000),
            blurRadius: 3,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
          const BoxShadow(
            color: Color(0x15000000),
            blurRadius: 3,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Stack(children: [
                    SvgPicture.asset(
                      imagePath,
                      semanticsLabel: 'Apple Logo',
                    )
                  ]),
                ),
                const SizedBox(width: 15),
                Text(
                  'Continue with Apple',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
