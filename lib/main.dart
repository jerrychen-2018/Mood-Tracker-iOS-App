import 'package:ebbnflow/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:ebbnflow/Screens/Home/home_page.dart';
import 'package:ebbnflow/Screens/VerseList/verse_list.dart';
import 'package:ebbnflow/models/breadify.dart';
import 'package:ebbnflow/Screens/Welcome/welcome_page.dart';
import 'package:ebbnflow/models/theme_provider.dart';
import 'package:ebbnflow/themes/theme.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:after_layout/after_layout.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/feed':
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Breadify>(create: (_) => Breadify()),
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _timezone = "UTC";
  late bool _isLightTheme = true;

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

    _isLightTheme = prefs.getBool('lightTheme') ?? true;
    if (_isLightTheme) {
      Provider.of<ThemeProvider>(context, listen: false).themeData = lightMode;
    } else {
      Provider.of<ThemeProvider>(context, listen: false).themeData = darkMode;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breadify',
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/welcome',
      onGenerateRoute: Router.generateRoute,
      navigatorKey: navigatorKey,
      home: Splash(),
      routes: {
        '/verselist': (context) => const VerseList(),
        '/bottomnavbar': (context) => const BottomNavBar(),
        '/welcome': (context) => const WelcomePage()
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (!seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
