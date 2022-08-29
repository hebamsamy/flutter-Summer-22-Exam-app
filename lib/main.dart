import 'package:exam_app/QuestionScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Answer th Quizz"),
        ),
        body: MyWidget(),
      ),
    );
  }
}
