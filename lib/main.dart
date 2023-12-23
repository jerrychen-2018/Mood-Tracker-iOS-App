import 'package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:ebbnflow/Screens/VerseList/verse_list.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:ebbnflow/Screens/Welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _timezone = "UTC";

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _timezone = prefs.getString('timezone') ?? "UTC";

    try {
      _timezone = await FlutterNativeTimezone.getLocalTimezone();
      prefs.setString('timezone', _timezone);
    } catch (e) {
      print('Could not get the local timezone');
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Breadify(),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Breadify',
              home: const WelcomePage(),
              routes: {
                '/verselist': (context) => const VerseList(),
                '/bottomnavbar': (context) => const BottomNavBar(),
              },
            ));
  }
}
