import 'package:flutter/material.dart';
import 'dog_image_service.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Images App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DogImagePage(),
    );
  }
}

class DogImagePage extends StatefulWidget {
  @override
  _DogImagePageState createState() => _DogImagePageState();
}

class _DogImagePageState extends State<DogImagePage> {
  late Future<String> _dogImageUrl;
  final DogImageService _dogImageService = DogImageService();

  @override
  void initState() {
    super.initState();
    _fetchDogImage();
  }

  void _fetchDogImage() {
    setState(() {
      _dogImageUrl = _getValidDogImage();
    });
  }

  Future<String> _getValidDogImage() async {
    String imageUrl;
    bool isValid = false;

    while (!isValid) {
      try {
        imageUrl = await _dogImageService.fetchDogImage();
        final response = await http.head(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          isValid = true;
          return imageUrl;
        }
      } catch (e) {
        // Continua o loop até achar uma imagem
      }
    }

    throw Exception('Falha ao carregar nova imagem de cachorro');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagens de Doguinhos'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _dogImageUrl,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Buscando imagens, isso pode demorar um pouco.'),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    snapshot.data!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _fetchDogImage,
                    child: Text('Novo Doguinho'),
                  ),
                ],
              );
            } else {
              return Text('Nenhuma imagem carregada');
            }
          },
        ),
      ),
    );
  }
}
