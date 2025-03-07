import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<Map<String, String>> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    setState(() {
      items = [
        {'placa': 'JDK811', 'conductor': 'Jesús Jiménez', 'empresa': 'INDRA'},
        {'placa': 'KKC113', 'conductor': 'KAREN Lopez', 'empresa': 'CCCI'},
        {'placa': 'FXX130', 'conductor': 'Pedro Torres', 'empresa': 'TCC'},
        {'placa': 'FDD201', 'conductor': 'Carlos Magno', 'empresa': 'Betplay'},
        {'placa': 'FRR223', 'conductor': 'Carla Falo', 'empresa': 'WPLAY'},
        {
          'placa': 'KKB123',
          'conductor': 'Fabio Gonzalez',
          'empresa': 'Betplay',
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario: Admin'),
        centerTitle: true,
        shadowColor: Colors.grey,
        scrolledUnderElevation: 20.0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    child: Center(child: Image.asset('../assets/images/image.png', fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Placa: ${item['placa']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Conductor: ${item['conductor']}'),
                      Text('Empresa: ${item['empresa']}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
