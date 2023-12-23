import "package:ebbnflow/components/TimePicker/time_picker.dart";

import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class IntroPageThree extends StatefulWidget {
  const IntroPageThree({super.key});

  @override
  State<IntroPageThree> createState() => _IntroPageThreeState();
}

class _IntroPageThreeState extends State<IntroPageThree> {
  late int currHour = 7;
  late int currMinute = 30;
  late int currAmPm = 0;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currHour = prefs.getInt('hour') ?? 7;
      currMinute = prefs.getInt('minute') ?? 30;
      currAmPm = prefs.getInt('ampm') ?? 0;
    });
    if (!context.mounted) return null;
    Provider.of<Breadify>(context, listen: false).setHour(currHour);
    Provider.of<Breadify>(context, listen: false).setMinutes(currMinute);
    Provider.of<Breadify>(context, listen: false).setAmPm(currAmPm);
  }

  void updateProviderHour() {}

  void openTimePicker(int sh, int sm, int sap) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                TimePicker(
                  selectedHour: sh,
                  selectedMinute: sm,
                  selectedAmPm: sap,
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text('Done'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => SafeArea(
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
                    onTap: () {
                      openTimePicker(value.scheduledHour, value.scheduledMinute,
                          value.scheduledAmPm);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.cyan[600],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.65),
                              spreadRadius: 4,
                              blurRadius: 8,
                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ]),
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Stack(children: [
                            Icon(Icons.circle_notifications,
                                fill: 0.5, size: 35),
                          ]),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${value.scheduledHour}:${(value.scheduledMinute < 10) ? '0${value.scheduledMinute.toString()}' : value.scheduledMinute.toString()} ${(value.scheduledAmPm == 0) ? 'AM' : 'PM'}",
                            //"${currHour.toString()}:${(currMinute < 10) ? '0${currMinute.toString()}' : currMinute.toString()} ${(currAmPm == 0) ? 'AM' : 'PM'}",
                            style: const TextStyle(
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
                        // await service.showScheduledNotificationWithPayload(
                        //     id: 0,
                        //     title: "HI",
                        //     body: "HI",
                        //     seconds: 2,
                        //     payload: "payload");
                      },
                      child: Text("Button"))
                ],
              )),
            ));
  }
}
