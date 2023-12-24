import 'package:ebbnflow/components/TimePicker/ampm.dart';
import 'package:ebbnflow/components/TimePicker/minutes.dart';
import 'package:ebbnflow/components/TimePicker/hours.dart';
import 'package:provider/provider.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var minutes = Iterable<int>.generate(60).toList();
  var hours = Iterable<int>.generate(12).toList();

  @override
  Widget build(BuildContext context) {
    return Consumer<Breadify>(
        builder: (context, value, child) => SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      selectionOverlay: Container(
                        height: 50,
                        color: Colors.grey.withOpacity(0.3),
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
                      onSelectedItemChanged: (selectedItem) async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        if (context.mounted) {
                          Provider.of<Breadify>(context, listen: false)
                              .setHour(selectedItem + 1);
                        }
                        prefs.setInt('hour', selectedItem + 1);
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
                        color: Colors.grey.withOpacity(0.3),
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
                      onSelectedItemChanged: (selectedItem) async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setInt('minute', selectedItem);
                        if (context.mounted) {
                          Provider.of<Breadify>(context, listen: false)
                              .setMinutes(selectedItem);
                        }
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
                        color: Colors.grey.withOpacity(0.3),
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
                      children: const [AmPm(isItAm: true), AmPm(isItAm: false)],
                      onSelectedItemChanged: (selectedItem) async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setInt('ampm', selectedItem);
                        if (context.mounted) {
                          Provider.of<Breadify>(context, listen: false)
                              .setAmPm(selectedItem);
                        }
                        setState(() {
                          widget.selectedAmPm = selectedItem;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
