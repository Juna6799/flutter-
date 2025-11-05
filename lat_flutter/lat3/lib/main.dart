import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Input Sederhana'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _namacontroller = TextEditingController();
  final TextEditingController _kelascontroller = TextEditingController();

  String _nama = "";
  String _kelas = "";

  void _submitdata() {
    setState(() {
      _nama = _namacontroller.text;
      _kelas = _kelascontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _namacontroller,
            decoration: InputDecoration(
              labelText: 'MASUKKAN NAMA:',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _kelascontroller,
            decoration: InputDecoration(
              labelText: 'KELAS:',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitdata,
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
          Text(
            _nama.isEmpty ? '' : 'Nama: $_nama',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            _kelas.isEmpty ? '' : 'Kelas: $_kelas',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
