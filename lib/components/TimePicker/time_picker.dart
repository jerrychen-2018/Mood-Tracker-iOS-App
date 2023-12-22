import 'package:ebbnflow/components/TimePicker/ampm.dart';
import 'package:ebbnflow/components/TimePicker/minutes.dart';
import 'package:ebbnflow/components/TimePicker/hours.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  var minutes = Iterable<int>.generate(60).toList();
  var hours = Iterable<int>.generate(12).toList();
  int _selectedHour = 7;
  int _selectedMinute = 0;
  int _selectedAmPm = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              scrollController: new FixedExtentScrollController(
                initialItem: _selectedHour,
              ),
              itemExtent: 50,
              //backgroundColor: Colors.white,
              children: hours
                  .map((item) => Center(
                        child: MyHours(hrs: item),
                      ))
                  .toList(),
              onSelectedItemChanged: (selectedItem) {
                print(selectedItem + 1);
                setState(() {
                  _selectedHour = selectedItem + 1;
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
              scrollController: new FixedExtentScrollController(
                initialItem: _selectedMinute,
              ),
              itemExtent: 50,
              //backgroundColor: Colors.white,
              children: minutes
                  .map((item) => Center(
                        child: MyMinutes(mins: item),
                      ))
                  .toList(),
              onSelectedItemChanged: (selectedItem) {
                print(selectedItem);
                setState(() {
                  _selectedMinute = selectedItem;
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
              scrollController: new FixedExtentScrollController(
                initialItem: _selectedAmPm,
              ),
              itemExtent: 50,
              //backgroundColor: Colors.white,
              children: [AmPm(isItAm: true), AmPm(isItAm: false)],
              onSelectedItemChanged: (selectedItem) {
                print(selectedItem);
                setState(() {
                  _selectedAmPm = selectedItem;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
