import 'package:flutter/material.dart';

class finalWidget extends StatelessWidget {

  final width = 12.0;
  final ButtonStyle styleButton = ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 86, 86, 86),
      textStyle: const TextStyle(
          fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)));
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(width),
      child:  Text("Has terminado", 
              style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,),
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