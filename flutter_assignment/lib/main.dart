// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import './textBox.dart';
import './final.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _textToDisplay = ["Texto 1", "Texto 2", "Texto 3"];

  var _ixText = 0;

  // void _resetText()

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget assignament',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 55, 55),
          title: Text('Widget assignament'),
        ),
        body: _questionIndex < _textToDisplay.length 
        ? Question(_textToDisplay[_questionIndex], _nextText)
        : finalWidget(),
      ),
    );
  }

  var _questionIndex = 0;

  void _nextText() {
    setState(() {
      _questionIndex = _questionIndex + 1;});

    print(_questionIndex);
    if (_questionIndex < 2) {
      print('We have more questions!');
    } else  {
      print('No more questions!');
      
    }
  }

}

