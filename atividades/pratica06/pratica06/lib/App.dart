import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'Profile.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  Future<List<String>?>? _currentUserFuture;

  @override
  void initState() {
    super.initState();
    _isLogged();
    _currentUserFuture = _getUserData();
  }

  Future<List<String>?> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("users");
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
    _getUserData();
    _isLogged();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<String>?>(
        future: _currentUserFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No user data found"));
          } else {
            return IndexedStack(
              index: _currentIndex,
              children: [
                Home(user: snapshot.data),
                Profile(name: snapshot.data![2], email: snapshot.data![0]),
                // Add other widgets for "Lista" and "Perfil" here
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
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
