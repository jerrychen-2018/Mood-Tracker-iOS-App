import 'package:ebbnflow/models/theme_provider.dart';
import 'package:ebbnflow/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(title: const Text("App Theme")),
              body: SingleChildScrollView(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Toggle app theme",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                        if (value.themeData == lightMode) {
                          prefs.setBool('lightTheme', true);
                        } else {
                          prefs.setBool('lightTheme', false);
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary),
                        child: Center(
                            child: Text(
                                (Provider.of<ThemeProvider>(context)
                                            .themeData ==
                                        lightMode)
                                    ? "Light"
                                    : "Dark",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary))),
                      ),
                    )
                  ],
                )),
              ),
            ));
  }
}
