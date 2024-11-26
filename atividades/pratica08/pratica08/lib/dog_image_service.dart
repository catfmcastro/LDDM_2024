import 'dart:convert';
import 'package:http/http.dart' as http;

class DogImageService {
  static const String _baseUrl = 'https://api.thedogapi.com/v1/images/search';

  Future<String> fetchDogImage() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data[0]['url'];
    } else {
      throw Exception('Falha ao carregar imagem');
    }
  }
}
