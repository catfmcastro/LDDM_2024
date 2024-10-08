/*
  Pratica 01 - Interface

  @owner: @catfmcastro - Catarina F. M. Castro
  LDDM 2024_2
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Prática 01 - Interface',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Login", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white),),
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
                  const SizedBox(height: 20,),
                  Container (
                    child: ElevatedButton(
                      onPressed: () => {}, 
                      child: Text("Entrar", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),)
                  ),
                  const SizedBox(height: 20,),
                  Row (                    
                    children: <Widget>[
                      Expanded(
                        child: Text("Novo aqui?"),
                      ),
                      Expanded (child: TextButton(onPressed: () => {}, child: Text("Criar conta", style: TextStyle(color: Colors.blue))),
                        )
                    ]
                  )
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
