import 'package:ebbnflow/Screens/Onboarding/intro_page_one.dart';
import 'package:ebbnflow/Screens/Onboarding/intro_page_two.dart';
import 'package:ebbnflow/Screens/Onboarding/intro_page_three.dart';
import "package:ebbnflow/Screens/Verse/emotions_words_page_onboard.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnboardingPage> {
  // controller to keep track which page we're on
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [
                IntroPageOne(),
                IntroPageTwo(),
                IntroPageThree(),
              ]),

          //dot indicators
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                    child: const Text("Skip"),
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),

                  //next or done
                  onLastPage
                      ? GestureDetector(
                          child: const Text("Done"),
                          onTap: () {
                            showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const EmotionWordsPageOnboard());
                          },
                        )
                      : GestureDetector(
                          child: const Text("Next"),
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                        )
                ],
              ))
        ],
      ),
    );
  }
}
