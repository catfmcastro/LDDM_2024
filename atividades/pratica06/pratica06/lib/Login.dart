// Login page

import 'package:flutter/material.dart';
import 'package:pratica06/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _isLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogged = prefs.getBool('isLogged');

    if (isLogged == true) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? users = prefs.getStringList('users');

    if (users != null) {
      if (users.contains(_emailController.text) && users.contains(_passwordController.text)) {
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
        prefs.setBool('isLogged', true);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _createDialog();
      }
    } else {
      _createDialog();
    }

  }

  void _createDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Erro"),
        content: Text("Usuário ou senha inválidos"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          )
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {
    _isLogged();

    return MaterialApp(
        title: 'Login',
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text("Login", style: TextStyle(color: Colors.white)),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            drawer: Drawer(),
            body: Center(
              child: Container(
                  width: 200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: "E-mail"),
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: "Senha"),
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: ElevatedButton(
                        onPressed: _login,
                        child: Text("Entrar",
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Text("Novo aqui?"),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignIn()));
                              },
                              child: Text("Criar conta",
                                  style: TextStyle(color: Colors.blue))),
                        )
                      ])
                    ],
                  )

                  // child: TextField(
                  //   decoration: InputDecoration(labelText: "Email: "),
                  //   style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
            )));
  }
}
