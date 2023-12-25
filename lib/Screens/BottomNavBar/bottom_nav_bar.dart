import "package:ebbnflow/Screens/Settings/settings.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import "package:ebbnflow/Screens/VerseList/verse_list.dart";
import "package:ebbnflow/Screens/Verse/emotions_words_page.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
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

  Future<void> addVerse() async {
    await showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => const EmotionWordsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pageOptions.elementAt(_selectedPageIndex)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            backgroundColor: Colors.white,
            color: Color.fromRGBO(56, 129, 172, 1),
            activeColor: Color.fromRGBO(33, 93, 128, 1),
            gap: 8,
            iconSize: 32,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(icon: Icons.settings, text: "Settings")
            ],
            onTabChange: _onItemTapped,
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          onPressed: addVerse,
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 8,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
