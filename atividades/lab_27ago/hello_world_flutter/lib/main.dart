/*
  Ex 02 - Escrever "Hello World"
    1) sem usar widgets OK
    2) usando widgets OK
*/

import 'package:flutter/material.dart';

void main() {
  runApp(myApp()
  );
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Ex02',
      home: Scaffold(
        body: Center(
          child: Text("Hello World")
        )
      )
    );
  }
}

