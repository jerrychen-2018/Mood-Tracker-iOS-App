import "package:ebbnflow/Screens/Settings/settings.dart";
import "package:ebbnflow/Screens/Verse/emotions_words_page.dart";
import "package:ebbnflow/Screens/VerseList/verse_list.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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

  void addVerse() {
    showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => EmotionWordsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pageOptions.elementAt(_selectedPageIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.scroll), label: "List"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gear), label: "Settings")
        ],
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addVerse,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
