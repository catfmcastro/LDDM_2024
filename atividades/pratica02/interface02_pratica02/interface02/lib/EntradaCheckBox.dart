import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  @override
  _EntradaCheckBoxState createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool _leite = false;
  bool _pao = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Compras"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text("Leite"),
              secondary: Icon(Icons.add_box),
              value: _leite,
              onChanged: (bool? valor) {
                // 'bool?' para aceitar nulos
                setState(() {
                  _leite = valor ?? false; // Se 'valor' for null, usa 'false'
                });
              },
            ),
            CheckboxListTile(
              title: Text("Pão"),
              secondary: Icon(Icons.add_box),
              value: _pao,
              onChanged: (bool? valor) {
                // 'bool?' para aceitar nulos
                setState(() {
                  _pao = valor ?? false; // Se 'valor' for null, usa 'false'
                });
              },
            ),
            ElevatedButton(
              child: Text("Salvar"),
              onPressed: () {
                print(" Leite: " +
                    _leite.toString() +
                    " Pão: " +
                    _pao.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
