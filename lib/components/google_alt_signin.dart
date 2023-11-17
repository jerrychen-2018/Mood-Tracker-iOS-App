import 'package:flutter/material.dart';

class GoogleAltSignIn extends StatelessWidget {
  final String imagePath;
  const GoogleAltSignIn({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 34),
      decoration: ShapeDecoration(
        color: Colors.white,
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
              color: Colors.white,
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
                  decoration: BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.50,
                        top: 0.50,
                        child: Container(
                          width: 23,
                          height: 23,
                          child: Stack(
                            children: [Image.asset(imagePath)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  'Continue with Google',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5400000214576721),
                    fontSize: 20,
                    fontFamily: 'Roboto',
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