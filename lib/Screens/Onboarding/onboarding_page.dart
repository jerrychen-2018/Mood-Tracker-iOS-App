import 'package:ebbnflow/Screens/Onboarding/intro_page_one.dart';
import 'package:ebbnflow/Screens/Onboarding/intro_page_two.dart';

import "package:ebbnflow/Screens/Verse/emotions_words_page_onboard.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import "package:ebbnflow/services/local_notification_service.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ebbnflow/main.dart';

//import "package:ebbnflow/services/local_notification_service.dart";
//import "package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart";

//import 'package:ebbnflow/main.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final LocalNotificationService service = LocalNotificationService();
  late int savedHour = 7;
  late int savedMinutes = 30;
  late int savedAmPm = 0;
  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      navigatorKey.currentState?.pushNamedAndRemoveUntil('/bottomnavbar',
          (route) => (route.settings.name != '/bottomnavbar') || route.isFirst);
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedHour = prefs.getInt('hour') ?? 7;
      savedMinutes = prefs.getInt('minute') ?? 30;
      savedAmPm = prefs.getInt('ampm') ?? 0;
    });
  }

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
                  onLastPage = (index == 1);
                });
              },
              children: const [
                IntroPageOne(),
                IntroPageTwo(),
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
                      _controller.jumpToPage(1);
                    },
                  ),
                  SmoothPageIndicator(controller: _controller, count: 2),

                  //next or done
                  onLastPage
                      ? GestureDetector(
                          child: const Text("Done"),
                          onTap: () async {
                            listenToNotification();
                            service.setup();
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            service.deleteAllNotifications();
                            await service.showScheduledNotificationWithPayload(
                                id: 0,
                                title: "Breadify",
                                body: "How are you doing today?",
                                payload: "payload of notification");

                            await prefs.setBool('seen', true);

                            if (!context.mounted) return;
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
