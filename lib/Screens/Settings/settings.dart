import 'package:ebbnflow/components/my_time_picker_button.dart';

import "package:flutter/material.dart";

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Settings ⚙️",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          actions: [
            Icon(Icons.abc),
            Icon(Icons.lock_clock),
            SizedBox(
              width: 30,
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Schedule Daily Notificiation"),
              const MyTimePickerButton(),
              Switch.adaptive(
                value: _value,
                onChanged: (newValue) => setState(() => _value = newValue),
                activeColor: Colors.white,
                trackColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.black.withOpacity(.48);
                  }
                  return Colors.black;
                }),
                thumbColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.deepPurple.withOpacity(.48);
                  }
                  return Colors.deepPurple;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
