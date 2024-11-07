import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List<String>? user;
  const Home({super.key, required this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name;

  @override
  void initState() {
    super.initState();
    name = widget.user?[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text("Seja bem vindo $name!"),
        ]),
      ),
    );
  }
}
