import "package:flutter/material.dart";

class MyVerseTileDetails extends StatelessWidget {
  final String verseTitle;
  final String verse;
  final String emotions;
  final String date;
  const MyVerseTileDetails(
      {required this.verseTitle,
      required this.verse,
      required this.emotions,
      required this.date,
      super.key});

  List<String> wordsStringToList(String words) {
    List<String> res = [];
    res = words.split(RegExp('[^A-Za-z]'));
    res.removeWhere((element) => element == "");
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("📖  ${verseTitle}",
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              child: Text(
                verse,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              runSpacing: 5.0,
              spacing: 5.0,
              children: [
                for (var x in wordsStringToList(emotions))
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.amber.shade900,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            x,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }
}
