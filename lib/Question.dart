import 'package:flutter/cupertino.dart';

class Question {
  String text;
  int number;
  int mark;
  bool answer;
  Question(this.number, this.text, this.answer, this.mark);
}
