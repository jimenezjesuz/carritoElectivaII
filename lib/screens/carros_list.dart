import 'package:flutter/material.dart';
import '../service/carro_service.dart';

class CarrosScreen extends StatefulWidget {
  final String token;
  CarrosScreen({required this.token});

  @override
  _CarrosScreenState createState() => _CarrosScreenState();
}

class _CarrosScreenState extends State<CarrosScreen> {
  final CarrosService _carrosService = CarrosService();
  List<Map<String, dynamic>>? carros;

  @override
  void initState() {
    super.initState();
    _loadCarros();
  }

  void _loadCarros() async {
    final data = await _carrosService.getCarros(widget.token);
    setState(() {
      carros = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Carros')),
      body: carros == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: carros!.length,
              itemBuilder: (context, index) {
                final carro = carros![index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      carro['imagen'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text('Placa: ${carro['placa']}'),
                    subtitle: Text('Conductor: ${carro['conductor']}'),
                  ),
                );
              },
            ),
    );
  }
}
