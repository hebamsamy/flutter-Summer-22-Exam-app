import 'package:audioplayers/audioplayers.dart';
import 'package:exam_app/Question.dart';
import 'package:exam_app/QuestionBank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => QuestionScreen();
}

class QuestionScreen extends State<MyWidget> {
  var bank = QuestionBank();
  List<Icon> result = [];
  bool isfinished = false;
  int totalMark = 0;
  AudioPlayer player = AudioPlayer();
  Check(bool useranswer) async {
    setState(() {
      if (bank.GetCurrentQuestion().answer == useranswer) {
        player.play(AssetSource("right.mp3"));
        print("Correct answer");
        result.add(Icon(
          Icons.check_sharp,
          color: Colors.green,
        ));
        totalMark += bank.GetCurrentQuestion().mark;
      } else {
        player.play(AssetSource("wrong.mp3"));
        print("Wrong answer \n try again");
        result.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      bank.MovetoNext();
      print(bank.CurrentQuNum);
      if (bank.CurrentQuNum == bank.Questions.length - 1) {
        isfinished = true;
        // print(bank.CurrentQuNum);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Number of Question ${bank.Questions.length}'),
        ),
        Row(
          children: result,
        ),
        Center(
          child: Text(
            (isfinished) ? "Your Score is ${totalMark}" : '',
            style: TextStyle(
                fontSize: 25,
                color: (totalMark < 5) ? Colors.red : Colors.green),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              (!isfinished)
                  ? 'QUESTION ${bank.GetCurrentQuestion().number}'
                  : "",
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.question_mark,
          ),
          title: Text(
            bank.GetCurrentQuestion().text,
            style: TextStyle(color: Colors.grey[700], fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                if (isfinished) {
                  return;
                }
                Check(true);
              },
              child: Text("YES"),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.red),
              onPressed: () {
                if (isfinished) {
                  return;
                }
                Check(false);
              },
              child: Text("NO"),
            )
          ],
        )
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
