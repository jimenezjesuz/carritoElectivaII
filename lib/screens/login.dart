import 'package:carritos/screens/beforeScanner.dart';
import 'package:carritos/screens/carros_list.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';
import '../service/carro_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var msg = "";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final carrosService = CarrosService();

  void _login() async {
    final username = _emailController.text;
    final password = _passwordController.text;

    if (username.isEmpty) {
      setState(() {
        msg = "Digite el email";
        return;
      });
    }
    if (password.isEmpty) {
      setState(() {
        msg = "Digite el email";
        return;
      });
    }
    if (!(username == "admin" && password == "admin")) {
      setState(() {
        msg = "Credenciales invalidas";
        return;
      });
    }
    String? token = await _authService.authenticate(username, password);
    print(token);

    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CarrosScreen(token: token)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al autenticar')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(onPressed: _login, child: Text('Iniciar Sesión')),
          ],
        ),
      ),
    );
  }
}
