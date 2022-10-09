import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final Function nextTextFunction;

  Question(this.questionText, this.nextTextFunction);

  final width = 8.0;
  final ButtonStyle styleButton = ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 158, 158, 158),
      textStyle: const TextStyle(
          fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)));
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(width),
      child:  ElevatedButton(
        style: styleButton,
        child: Text(questionText),
        onPressed: () => nextTextFunction(),
      ),
    );
  }
}


/*

        //style: ButtonStyle(
          //backgroundColor: MaterialStateProperty.all(
          //Colors.lightBlueAccent)
          //),
MaterialApp(
,
        home: MyWidget());
*/