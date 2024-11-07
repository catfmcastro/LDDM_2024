import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  List<String>? _currentUser;

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentUser = prefs.getStringList("users");
  }

  void _isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogged = prefs.getBool("isLogged");
    if (isLogged == null || isLogged == false) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _isLogged();

    return Scaffold(
      appBar: AppBar(
        title: Text("Prática 06 - Shared Preferences"),
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [Home()], // !!! ADD PERFIL E LISTA
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Perfil"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
