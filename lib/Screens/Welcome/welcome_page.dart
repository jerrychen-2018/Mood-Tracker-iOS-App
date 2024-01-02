import 'package:ebbnflow/Screens/LoginOrRegister/login_or_register_page.dart';

import 'package:ebbnflow/Screens/Onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:delayed_display/delayed_display.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void getStarted() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const OnboardingPage()));
  }

  void toLogin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginOrRegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * (0.8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DelayedDisplay(
                delay: Duration(milliseconds: 500),
                fadingDuration: Duration(seconds: 1),
                child: Text(
                  "Hey friend, welcome! 😁",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    //color: Colors.white,
                  ),
                ),
              ),
              const Gap(30),
              const DelayedDisplay(
                delay: Duration(milliseconds: 2500),
                fadingDuration: Duration(seconds: 1),
                child: Text(
                  "This is Breadify, a daily Bible verse app.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    //color: Colors.white,
                  ),
                ),
              ),
              const Gap(30),
              const DelayedDisplay(
                delay: Duration(milliseconds: 4500),
                fadingDuration: Duration(seconds: 3),
                child: Text(
                  "Helping you grow in your walk with God, one verse at a time.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    //color: Colors.white,
                  ),
                ),
              ),
              const Gap(50),
              DelayedDisplay(
                  delay: Duration(milliseconds: 6500),
                  fadingDuration: Duration(seconds: 1),
                  child: GestureDetector(
                    onTap: getStarted,
                    child: Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.primary),
                      child: Center(
                          child: Text("Get started",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary))),
                    ),
                  )),
              const Gap(30),
            ],
          ),
        ),
      )),
    );
  }
}
