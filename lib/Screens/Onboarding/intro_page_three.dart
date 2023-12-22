import "package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart";
import "package:ebbnflow/components/TimePicker/time_picker.dart";
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
    listenToNotification();
    super.initState();
  }

  void openTimePicker() {
    service.setup();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Build Habits with Reminders",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: openTimePicker,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan[600],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.65),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ]),
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              padding: EdgeInsets.all(20),
              child: const Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    Icon(Icons.circle_notifications, fill: 0.5, size: 35),
                  ]),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "7:00 AM",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
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
