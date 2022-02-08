import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  String answerText;
  void Function() click;

  Answer(this.answerText,this.click);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: click,
        child: Text(this.answerText),
    );
  }
}
