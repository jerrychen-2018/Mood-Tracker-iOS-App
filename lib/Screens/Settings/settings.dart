import 'package:ebbnflow/components/AboutSettings/settings_about_page.dart';
import 'package:ebbnflow/components/NotificationSettings/settings_notification_page.dart';
import 'package:ebbnflow/components/ThemeSettings/settings_theme_page.dart';
import 'package:ebbnflow/components/my_settings_tile.dart';

import "package:flutter/material.dart";

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Settings ⚙️",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                MySettingsTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NotificationsPage()));
                    },
                    text: "Notifications"),
                const SizedBox(
                  height: 20,
                ),
                MySettingsTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ThemePage()));
                    },
                    text: "App Theme"),
                const SizedBox(
                  height: 20,
                ),
                MySettingsTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                    },
                    text: "About"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
