import 'package:ebbnflow/Screens/Home/home_page.dart';
import 'package:ebbnflow/Screens/LoginOrRegister/login_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ebbnflow/components/my_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void getStarted() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Current",
                style: TextStyle(fontSize: 30),
              ),
              Gap(10),
              Text(
                  "Helping you grow in your walk with God, one verse at a time!"),
              Gap(50),
              MyButton(
                onTap: getStarted,
                text: "Get Started",
              )
            ],
          ),
        ),
      )),
    );
  }
}
