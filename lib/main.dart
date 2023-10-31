import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("data"),
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://static.wixstatic.com/media/923643_969ac40986c5484eaf73f74dad7d6ff7~mv2.jpg/v1/fill/w_560,h_400,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/923643_969ac40986c5484eaf73f74dad7d6ff7~mv2.jpg'),
          ),
        ),
      ),
    ),
  );
}
