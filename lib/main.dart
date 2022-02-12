import 'package:flutter/material.dart';

import './answer.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: QuizAppBody(),
      ),
    );
  }
}

class QuizAppBody extends StatefulWidget {
  const QuizAppBody({Key? key}) : super(key: key);

  @override
  _QuizAppBodyState createState() => _QuizAppBodyState();
}

class _QuizAppBodyState extends State<QuizAppBody> {
  int i = 0;
  List<Item> items = [
    new Item(question: "Lieblingsfirma", answers: ["webCom", "fi", "ibm"]),
    new Item(question: "Lieblings-ide", answers: ["Intelij", "Eclipse", "AndroidStudio"]),
    new Item(question: "Lieblingsband", answers: ["beatles", "ac/dc", "green day"])
  ];

  void click() {
    setState(() {
      if (this.i == this.items.length  -1 ) {
        i = 0;
      } else {
        i++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: renderQuestion(),
      ),
    );
  }

  Widget renderQuestion() {
    Item item = this.items[this.i];
    return Column(
      children: [
        Text(item.question),
        ...(item.answers as List<String>).map((anserText) {
          return new Answer(anserText, click);
        }).toList()
      ],
    );
  }
}

class Item {
  String question;
  List<String> answers;

  Item({required this.question, required this.answers});
}
