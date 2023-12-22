import "package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart";
import "package:ebbnflow/Screens/test_screen.dart";
import "package:ebbnflow/services/local_notification_service.dart";
import "package:flutter/material.dart";

class IntroPageThree extends StatefulWidget {
  const IntroPageThree({super.key});

  @override
  State<IntroPageThree> createState() => _IntroPageThreeState();
}

class _IntroPageThreeState extends State<IntroPageThree> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.setup();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Build Habits with Reminders",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () async {
                // await service.showLocalNotification(
                //   id: 0,
                //   title: "HI",
                //   body: "HI",
                // );
                await service.showScheduledNotificationWithPayload(
                    id: 0,
                    title: "HI",
                    body: "HI",
                    seconds: 2,
                    payload: "payload");
              },
              child: Text("Button"))
        ],
      )),
    );
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => BottomNavBar())));
    }
  }
}
