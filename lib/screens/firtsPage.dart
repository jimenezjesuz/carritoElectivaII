import 'package:flutter/material.dart';

class FirtsPage extends StatefulWidget {
  @override
  _FirtsPage createState() => _FirtsPage();
}

class _FirtsPage extends State<FirtsPage> {
  List<Map<String, String>> items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Botones centrados')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Botón 1')),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Botón 2')),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Botón 3')),
          ],
        ),
      ),
    );
  }
}
