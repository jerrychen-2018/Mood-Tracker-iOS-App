import 'package:ebbnflow/components/my_time_picker_button.dart';
import "package:ebbnflow/services/local_notification_service.dart";
import 'package:ebbnflow/main.dart';
import "package:flutter/material.dart";

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final LocalNotificationService service = LocalNotificationService();

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
  void didUpdateWidget(Settings oldWidget) {
    // TODO: implement dispose
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Settings",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Schedule Daily Notificiation"),
              const MyTimePickerButton(),
              ElevatedButton(
                  onPressed: () async {
                    // service ??= LocalNotificationService();
                    listenToNotification();
                    service.setup();
                    service.deleteAllNotifications();
                    await service.showScheduledNotificationWithPayload(
                        id: 0,
                        title: "Breadify",
                        body: "How are you doing today?",
                        payload: "payload of notification");
                  },
                  child: Text("Save Changes"))
            ],
          ),
        ),
      ),
    );
  }
}
