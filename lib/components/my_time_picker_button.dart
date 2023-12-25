import "package:ebbnflow/components/TimePicker/time_picker.dart";

import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyTimePickerButton extends StatefulWidget {
  const MyTimePickerButton({super.key});

  @override
  State<MyTimePickerButton> createState() => _MyTimePickerButtonState();
}

class _MyTimePickerButtonState extends State<MyTimePickerButton> {
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

  void openTimePicker(int sh, int sm, int sap) async {
    await showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        // backgroundColor: Colors.transparent,
        builder: (context) => TimePicker(
              selectedHour: sh,
              selectedMinute: sm,
              selectedAmPm: sap,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => GestureDetector(
              onTap: () {
                openTimePicker(value.scheduledHour, value.scheduledMinute,
                    value.scheduledAmPm);
              },
              child: Container(
                height: 80,
                width: 250,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 6,
                        offset:
                            const Offset(0, 5), // changes position of shadow
                      ),
                    ]),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Stack(children: [
                      Icon(Icons.circle_notifications, fill: 0.5, size: 35),
                    ]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${value.scheduledHour}:${(value.scheduledMinute < 10) ? '0${value.scheduledMinute.toString()}' : value.scheduledMinute.toString()} ${(value.scheduledAmPm == 0) ? 'AM' : 'PM'}",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ));
  }
}
