/*
  Ex 02 - LDDM
    1) sem usar widgets OK
    2) usando widgets OK

  @owner: @catfmcastro
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ex02',
        home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.blue,),
          drawer: Drawer(),
          bottomNavigationBar:
              BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home), 
                    label: "Home"
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Minha Conta")
                ]
              ),
          body: Center(
            child: Container(
              width: 200,
              child: Column (
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: "E-mail"),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                  const SizedBox(height: 20,),
                  const TextField(
                    decoration: InputDecoration(labelText: "Senha"),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                  
                ],
              )


              // child: TextField(
              //   decoration: InputDecoration(labelText: "Email: "),
              //   style: TextStyle(color: Colors.purple, fontSize: 20),
              ),

            )
          )
        );
  }
}
