// Sign-In page

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();

    if (_emailController.text.isNotEmpty) {
      String email = _emailController.text;
      String password = _passwordController.text;
      String name = _nameController.text;

      List<String>? user = [email, password, name];
      prefs.setStringList("users", user);

      print("Operação salvar: $email, $password, $name");
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
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
                    TextField(
                      controller: _nameController,
                      maxLength: 50,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: "Nome"),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "E-mail"),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // CAMPO DE SENHA
                    PasswordField(passwordController: _passwordController),

                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _saveData,
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
  final TextEditingController passwordController;
  const PasswordField({super.key, required this.passwordController});

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
            controller: widget.passwordController,
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