import 'package:ebbnflow/Screens/Onboarding/intro_page_one.dart';
import 'package:ebbnflow/Screens/Onboarding/intro_page_two.dart';
import 'package:ebbnflow/Screens/Onboarding/intro_page_three.dart';
import "package:ebbnflow/Screens/Verse/emotions_words_page_onboard.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import "package:ebbnflow/services/local_notification_service.dart";
//import "package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart";

import 'package:ebbnflow/main.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final LocalNotificationService service = LocalNotificationService();

  // controller to keep track which page we're on
  final PageController _controller = PageController();
  bool onLastPage = false;

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil('/bottomnavbar', (route) => false);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: ((context) => BottomNavBar())));
    }
  }

  @override
  void didUpdateWidget(OnboardingPage oldWidget) {
    // TODO: implement dispose
    super.didUpdateWidget(oldWidget);
  }

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
                          onTap: () async {
                            //service = LocalNotificationService();
                            listenToNotification();
                            service.setup();

                            service.deleteAllNotifications();
                            await service.showScheduledNotificationWithPayload(
                                id: 0,
                                title: "Breadify",
                                body: "How are you doing today?",
                                payload: "payload of notification");

                            if (!context.mounted) return null;
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
