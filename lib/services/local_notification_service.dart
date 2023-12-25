import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationService {
  LocalNotificationService();
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  Future<void> setup() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSetting =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initSettings = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);

    await _flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
      onNotificationClick.add(notificationResponse.payload);
    });
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max);
    const DarwinNotificationDetails iOSNotificationDetails =
        DarwinNotificationDetails(presentSound: false);

    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iOSNotificationDetails);
  }

  Future<void> showLocalNotification(
      {required int id, required String title, required String body}) async {
    final details = await _notificationDetails();
    await _flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

  Future<void> showScheduledNotificationWithPayload(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final details = await _notificationDetails();

    String tz = prefs.getString('timezone') ?? "America/Los_Angeles";

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        _nextInstanceOfTime(tz, prefs.getInt('hour') ?? 7,
            prefs.getInt('minute') ?? 30, prefs.getInt('ampm') ?? 0),
        details,
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfTime(
      String timezone, int hour, int min, int ampm) {
    final loc = tz.getLocation(timezone);
    final tz.TZDateTime now = tz.TZDateTime.now(loc);
    if ((ampm == 1) && (hour != 12)) {
      hour += 12;
    } else if ((ampm == 0) && (hour == 12)) {
      hour = 0;
    }
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(loc, now.year, now.month, now.day, hour, min);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }

  Future<void> deleteAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  // void onSelectNotification(String? payload) {
  //   print('payload $payload');
  // }
}
