import "package:ebbnflow/Screens/Settings/settings.dart";

import "package:ebbnflow/Screens/VerseList/verse_list.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "package:flutter/material.dart";

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pageOptions = <Widget>[const VerseList(), const Settings()];
  int _selectedPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pageOptions.elementAt(_selectedPageIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.scroll), label: "List"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gear), label: "Settings")
        ],
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
