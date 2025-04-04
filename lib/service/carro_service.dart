import 'package:http/http.dart' as http;
import 'dart:convert';
class CarrosService {
  final String carrosUrl = 'https://carros-electricos.wiremockapi.cloud/carros';

Future<List<Map<String, dynamic>>?> getCarros(String token) async {
    final headers = {
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(
        Uri.parse(carrosUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}