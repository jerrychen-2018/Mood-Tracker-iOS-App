import 'package:ebbnflow/components/TimePicker/ampm.dart';
import 'package:ebbnflow/components/TimePicker/minutes.dart';
import 'package:ebbnflow/components/TimePicker/hours.dart';
import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "package:ebbnflow/services/local_notification_service.dart";
import 'package:ebbnflow/main.dart';

import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

class TimePicker extends StatefulWidget {
  int selectedHour;
  int selectedMinute;
  int selectedAmPm;
  TimePicker(
      {required this.selectedHour,
      required this.selectedMinute,
      required this.selectedAmPm,
      Key? key})
      : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final LocalNotificationService service = LocalNotificationService();

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil('/bottomnavbar', (route) => false);
    }
  }

  var minutes = Iterable<int>.generate(60).toList();
  var hours = Iterable<int>.generate(12).toList();

  late int savedHour = 7;
  late int savedMinutes = 30;
  late int savedAmPm = 0;

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

  @override
  void didUpdateWidget(TimePicker oldWidget) {
    // TODO: implement dispose
    super.didUpdateWidget(oldWidget);
  }

  void saveScheduledTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('hour', savedHour);
    prefs.setInt('minute', savedMinutes);
    prefs.setInt('ampm', savedAmPm);

    if (context.mounted) {
      Provider.of<Breadify>(context, listen: false).setHour(savedHour);
      Provider.of<Breadify>(context, listen: false).setMinutes(savedMinutes);
      Provider.of<Breadify>(context, listen: false).setAmPm(savedAmPm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.xmark),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        saveScheduledTime();
                        listenToNotification();
                        service.setup();

                        service.deleteAllNotifications();
                        await service.showScheduledNotificationWithPayload(
                            id: 0,
                            title: "Breadify",
                            body: "How are you doing today?",
                            payload: "payload of notification");
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.secondary),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CupertinoPicker(
                            selectionOverlay: Container(
                              height: 50,
                              color: Colors.white38,
                            ),
                            magnification: 0.9,
                            squeeze: 1.5,
                            useMagnifier: true,
                            diameterRatio: 1.2,
                            scrollController: FixedExtentScrollController(
                              initialItem: widget.selectedHour - 1,
                            ),
                            itemExtent: 50,
                            //backgroundColor: Colors.white,
                            children: hours
                                .map((item) => Center(
                                      child: MyHours(hrs: item),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (selectedItem) {
                              // final SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                              savedHour = selectedItem + 1;

                              // if (context.mounted) {
                              //   Provider.of<Breadify>(context, listen: false)
                              //       .setHour(selectedItem + 1);
                              // }
                              // prefs.setInt('hour', selectedItem + 1);
                              setState(() {
                                widget.selectedHour = selectedItem + 1;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                            selectionOverlay: Container(
                              height: 50,
                              color: Colors.white38,
                            ),
                            magnification: 0.9,
                            squeeze: 1.5,
                            useMagnifier: true,
                            diameterRatio: 1.2,
                            scrollController: FixedExtentScrollController(
                              initialItem: widget.selectedMinute,
                            ),
                            itemExtent: 50,
                            //backgroundColor: Colors.white,
                            children: minutes
                                .map((item) => Center(
                                      child: MyMinutes(mins: item),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (selectedItem) {
                              // final SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                              savedMinutes = selectedItem;
                              // prefs.setInt('minute', selectedItem);
                              // if (context.mounted) {
                              //   Provider.of<Breadify>(context, listen: false)
                              //       .setMinutes(selectedItem);
                              // }
                              setState(() {
                                widget.selectedMinute = selectedItem;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                            selectionOverlay: Container(
                              height: 50,
                              color: Colors.white38,
                            ),
                            magnification: 0.9,
                            squeeze: 1.5,
                            useMagnifier: true,
                            diameterRatio: 1.2,
                            scrollController: FixedExtentScrollController(
                              initialItem: widget.selectedAmPm,
                            ),
                            itemExtent: 50,
                            //backgroundColor: Colors.white,
                            children: const [
                              AmPm(isItAm: true),
                              AmPm(isItAm: false)
                            ],
                            onSelectedItemChanged: (selectedItem) {
                              // final SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                              savedAmPm = selectedItem;
                              // prefs.setInt('ampm', selectedItem);
                              // if (context.mounted) {
                              //   Provider.of<Breadify>(context, listen: false)
                              //       .setAmPm(selectedItem);
                              // }
                              setState(() {
                                widget.selectedAmPm = selectedItem;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
