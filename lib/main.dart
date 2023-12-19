import 'package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:ebbnflow/Screens/VerseList/verse_list.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:ebbnflow/Screens/Welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
