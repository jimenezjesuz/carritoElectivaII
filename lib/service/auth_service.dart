import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String url = 'https://carros-electricos.wiremockapi.cloud/auth';
  final String carrosUrl = 'https://carros-electricos.wiremockapi.cloud/carros';

  Future<String> authenticate(String username, String password) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {'username': username, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        return token;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }
}
