
import 'package:ebbnflow/Screens/Home/home_selection_page.dart';
import 'package:ebbnflow/components/custom_slider_thumb.dart';
import 'package:ebbnflow/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  var parser = EmojiParser();
  Map<int, String> emojiMap = {1: "😢", 2: "🙁", 3: "😶", 4: "🙂", 5: "😆"};

  void submitMood() {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (builder) {
    //       return HomeSelectionPage(emoji: _moodState);
    //     });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomeSelectionPage(emoji: _moodState)),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  double _sliderValue = 3;
  String _moodState = "😶";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ]),
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Logged in as: ${user.email!}"),
                const SizedBox(
                  height: 15,
                ),
                Text('Slider Value: $_sliderValue'),
                const SizedBox(
                  height: 15,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 28,
                    thumbShape: CustomSliderThumb(_moodState),
                  ),
                  child: Slider.adaptive(
                    value: _sliderValue,
                    min: 1,
                    max: 5,
                    activeColor: Colors.blue[300],
                    thumbColor: Colors.blue[400],
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue = newValue;
                        if (newValue >= 1 && newValue < 2) {
                          _moodState = "😢";
                        }
                        if (newValue >= 2 && newValue < 3) {
                          _moodState = "🙁";
                        }
                        if (newValue >= 3 && newValue < 4) {
                          _moodState = "😶";
                        }
                        if (newValue >= 4 && newValue < 5) {
                          _moodState = "🙂";
                        }
                        if (newValue == 5) {
                          _moodState = "😆";
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        5,
                        (index) => Text(
                              emojiMap[index + 1]!,
                              style: const TextStyle(fontSize: 35),
                            )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    _moodState,
                    style: TextStyle(color: Colors.blue[700], fontSize: 50),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(onTap: submitMood, text: 'Submit'),
              ],
            ),
          )),
        ));
  }
}
