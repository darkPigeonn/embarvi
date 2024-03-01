import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/quiz/result.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class QuisPage extends StatefulWidget {
  const QuisPage({super.key});

  @override
  State<QuisPage> createState() => _QuisPageState();
}

class _QuisPageState extends State<QuisPage> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    print('$value value $selectedAnswerIndex  ');
    final question = questions[questionIndex];
    print(question['correctAnswer']);
    final correctAnswer = int.parse(question['correctAnswer'].toString()) - 1;
    if (selectedAnswerIndex == correctAnswer) {
      score++;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //       content: successAlert(),
      //       backgroundColor: Colors.transparent,
      //       behavior: SnackBarBehavior.floating,
      //       elevation: 0),
      // );
      showDialog(context: context, builder: (context) => successAlert());
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //       content: failAlert(),
      //       backgroundColor: Colors.transparent,
      //       behavior: SnackBarBehavior.floating,
      //       elevation: 0),
      // );
      showDialog(context: context, builder: (context) => failAlert());
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // #docregion platform_features
  }

  formatLabel(index) {
    switch (index) {
      case 0:
        return 'A. ';
        break;
      case 1:
        return 'B. ';
        break;
      case 2:
        return 'C. ';
        break;
      case 3:
        return 'D. ';
        break;
      case 4:
        return 'E. ';
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Map question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (questionIndex + 1).toString() + '. ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Flexible(child: HtmlWidget(question['question'])),
                  ],
                ),
                Spacing3,
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: question['options'].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,
                      child: AnswerCard(
                        currentIndex: index,
                        question:
                            "${formatLabel(index)} ${question['options'][index]['value']}",
                        isSelected: selectedAnswerIndex == index,
                        selectedAnswerIndex: selectedAnswerIndex,
                        correctAnswerIndex: question['correctAnswer'] - 1,
                      ),
                    );
                  },
                ),
                isLastQuestion
                    ? RectangularButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => ResultScreen(
                                score: score,
                              ),
                            ),
                          );
                        },
                        label: 'Finish',
                      )
                    : RectangularButton(
                        onPressed: selectedAnswerIndex != null
                            ? goToNextQuestion
                            : null,
                        label: 'Selanjutnya',
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class failAlert extends StatelessWidget {
  const failAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xFFC72C41),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Oopps..!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Divider(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Jawabanmu Kurang Tepat',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC72C41)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class successAlert extends StatelessWidget {
  const successAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        height: 180,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Selamat!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    'Jawabanmu Benar',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Text(
            //     'Jawabanmu Benar',
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctAnserIndex;

  const Question(this.question, this.options, this.correctAnserIndex);
}

/*
  If (no options is chosen)
    all answer cards should have default style
    all buttons should be enabled
  else
    all button should be disabled
    if (correct option is chosen)
      answer should be highlighted as green
    else
      answer should be highlighted as red
      correct answer should be highlighted as green
*/

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
      child: selectedAnswerIndex != null
          // if one option is chosen
          ? Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: isCorrectAnswer
                    ? Colors.green
                    : isWrongAnswer
                        ? Colors.red
                        : const Color.fromARGB(26, 87, 87, 87),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isCorrectAnswer
                      ? Colors.green
                      : isWrongAnswer
                          ? Colors.red
                          : const Color.fromARGB(26, 87, 87, 87),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: HtmlWidget(
                      question,
                      // style: const TextStyle(
                      //   fontSize: 16,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  isCorrectAnswer
                      ? buildCorrectIcon()
                      : isWrongAnswer
                          ? buildWrongIcon()
                          : const SizedBox.shrink(),
                ],
              ),
            )
          // If no option is selected
          : Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(26, 87, 87, 87),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: HtmlWidget(
                      question,
                      // style: const TextStyle(
                      //   fontSize: 16,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          color: onPressed != null ? bPrimary : null,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
