/*
  Pratica 02 - Tela de cadastro com tamanho superior à tela

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
        title: 'Prática 02 - Cadastro',
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text("Login", style: TextStyle(color: Colors.white)),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            drawer: Drawer(),
            bottomNavigationBar:
                BottomNavigationBar(items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Minha Conta")
            ]),
            body: Center(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      maxLength: 50,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: "Nome"),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const TextField(
                      keyboardType: TextInputType.datetime,
                      decoration:
                          InputDecoration(labelText: "Data de Nascimento"),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const TextField(
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      decoration: InputDecoration(labelText: "Telefone"),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "E-mail"),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const TextField(
                      maxLength: 20,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Senha"),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // SELEÇÃO DE GÊNERO com radio
                    GenderSelection(),

                    const SizedBox(
                      height: 20,
                    ),

                    // SELEÇÃO DE NOTIFICAÇÃO com switches
                    NotifSelection(),

                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Text("Cadastrar",
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )

                    // child: TextField(
                    //   decoration: InputDecoration(labelText: "Email: "),
                    //   style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
              )),
            )));
  }
}

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? _selected;

  void _handleGenderChange(String? value) {
    setState(() {
      _selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gênero:', style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
        Row(
          children: [
            Radio<String>(
              groupValue: _selected,
              value: 'masculino',
              onChanged: _handleGenderChange,
            ),
            Text('Masculino', style: TextStyle(fontSize: 16)),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              groupValue: _selected,
              value: 'feminino',
              onChanged: _handleGenderChange,
            ),
            Text('Feminino', style: TextStyle(fontSize: 16)),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              groupValue: _selected,
              value: "outro",
              onChanged: _handleGenderChange,
            ),
            Text('Outro', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}

class NotifSelection extends StatefulWidget {
  @override
  _NotifSelectionState createState() => _NotifSelectionState();
}

class _NotifSelectionState extends State<NotifSelection> {
  bool _email = false;
  bool _push = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Text('Notificações:', style: TextStyle(fontSize: 14)),
            SwitchListTile(
                activeColor: Colors.blue,
                title: Text("Email: "),
                value: _email,
                onChanged: (bool valor) {
                  setState(() {
                    _email = valor;
                  });
                }),
            SwitchListTile(
                activeColor: Colors.blue,
                title: Text("Push: "),
                value: _push,
                onChanged: (bool valor) {
                  setState(() {
                    _push = valor;
                  });
                }),
          ],
        ),
      );
  }
}
