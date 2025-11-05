import 'package:flutter/material.dart';
import 'package:lat8/halaman_produk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APLIKASI PRODUK',
      home: HalamanProduk(),
    );
  }
}