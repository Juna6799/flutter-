import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi (Pindah Halaman)',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Halaman Pertama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/bgjun.jpg',
              width: 300,
              height: 300,
            ),
            Image.asset(
              'assets/images/liv.jpg',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Horass semuanya',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Pindah Halaman 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kedua'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: MyForm()),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
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
  final TextEditingController _alamatcontroller = TextEditingController();

  String _nama = "";
  String _kelas = "";
  String _alamat = "";

  void _submitdata() {
    setState(() {
      _nama = _namacontroller.text;
      _kelas = _kelascontroller.text;
      _alamat = _alamatcontroller.text; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _namacontroller,
          decoration: const InputDecoration(
            labelText: 'MASUKKAN NAMA:',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _kelascontroller,
          decoration: const InputDecoration(
            labelText: 'KELAS:',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _alamatcontroller,
          decoration: const InputDecoration(
            labelText: 'ALAMAT:',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _submitdata,
          child: const Text('Submit'),
        ),
        const SizedBox(height: 20),
        Text(
          _nama.isEmpty ? '' : 'Nama: $_nama',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          _kelas.isEmpty ? '' : 'Kelas: $_kelas',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Text(
          _alamat.isEmpty ? '' : 'Alamat: $_alamat',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
