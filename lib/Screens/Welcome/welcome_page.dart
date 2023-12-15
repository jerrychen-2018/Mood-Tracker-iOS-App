import 'package:ebbnflow/Screens/Home/home_page.dart';
import 'package:ebbnflow/Screens/LoginOrRegister/login_or_register_page.dart';
import 'package:ebbnflow/Screens/Onboarding/onboarding_page.dart';
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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Breadify",
                style: TextStyle(fontSize: 30, fontFamily: 'SFPro'),
              ),
              const Gap(10),
              const Text(
                  "Helping you grow in your walk with God, one verse at a time!"),
              const Gap(50),
              MyButton(
                onTap: getStarted,
                text: "Get Started",
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: toLogin,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
