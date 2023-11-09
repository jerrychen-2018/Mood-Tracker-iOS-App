import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: const SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                //logo
                Icon(
                  Icons.lock_clock_rounded,
                  size: 100,
                ),

                SizedBox(
                  height: 50,
                ),
                //welcome back
                Text(
                  'Welcome to Current!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                //username textfield
                //password textfield
                //signin button
                // or continue with google or apple
                // not a member? register now
              ],
            ),
          ),
        ));
  }
}
