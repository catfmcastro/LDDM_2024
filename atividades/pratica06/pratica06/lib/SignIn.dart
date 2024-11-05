// Sign-In page

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _textController = TextEditingController();

  _saveData() async{
    String dados = _textController.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', dados);
    print("Operação salvar: $dados");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cadastro',
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue,
                title: const Text("Cadastro",
                    style: TextStyle(color: Colors.white)),
                iconTheme: IconThemeData(color: Colors.white),
                leading: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            body: Center(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      controller: _textController,
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

                    // CAMPO DE SENHA
                    PasswordField(),

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
                          onPressed: -_saveData(),
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

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            obscureText: _obscureText,
            style: TextStyle(color: Colors.purple, fontSize: 20),
            decoration: InputDecoration(
              labelText: "Senha",
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed:
                    _toggle, // Adiciona a função _toggle ao pressionar o ícone
              ),
            ),
            // FlatButton(
            //     onPressed: _toggle,
            //     child: new Text(_obscureText ? "Show" : "Hide"))
          )
        ],
      ),
    );
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
