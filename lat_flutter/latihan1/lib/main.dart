import 'package:flutter/material.dart';

void main() {
  runApp(const PageApp());
}

class PageApp extends StatelessWidget {
  const PageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: const Icon(Icons.home),
          title: const Text('Menampilkan Gambar')),
          body: Container(
            margin: const EdgeInsets.all(10.8),
            child: Column(children: [
            Row(children: <Widget> [
              Icon(Icons.archive),
              Text('Artikel Terbaru',
             style: TextStyle(fontWeight: FontWeight.bold))
            ]),
            Card(
              child: Column(children: <Widget> [
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVaZeyZyihTlBhPG8-qn3w0rgGHOoGabjrhQ&s',
                width: 300,
                height: 200,
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}