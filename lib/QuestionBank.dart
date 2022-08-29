import 'package:exam_app/Question.dart';

class QuestionBank {
  List<Question> Questions = [
    Question(1, "You can lead a cow down stairs but not up stairs.", false, 1),
    Question(2, "Some cats are actually allergic to humans", true, 1),
    Question(3, "Approximately one quarter of human bones are in the feet.",
        false, 1),
    Question(4, "A slug's blood is green.", false, 1),
    Question(5, "Buzz Aldrin's mother's maiden name was 'Moon", true, 1),
    Question(6, "It is illegal to pee in the Ocean in Portugal.", false, 1),
    Question(
        7,
        "No piece of square dry paper can be folded in half more than 7 times.",
        true,
        1),
  ];

  int CurrentQuNum = 0;
  //get current Qu
  Question GetCurrentQuestion() {
    return Questions[CurrentQuNum];
  }

  //move next Qu
  void MovetoNext() {
    if (CurrentQuNum < Questions.length - 1) CurrentQuNum++;
  }
  //Check result

}
// 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true
// 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',false
// 'The total surface area of two human lungs is approximately 70 square metres.',true
// 'Google was originally called \"Backrub\".', true
// 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',true
// 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true
