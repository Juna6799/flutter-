import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  final Map Listdata;
  const DetailProduk({Key? key, required this.Listdata}):super(key:key);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
final formKey = GlobalKey<FormState>();
  TextEditingController id_produk = TextEditingController();
  TextEditingController nama_produk = TextEditingController();  
  TextEditingController harga_produk = TextEditingController(); 


  @override
  Widget build(BuildContext context) {
    id_produk.text = widget.Listdata['id_produk'];
    nama_produk.text = widget.Listdata['nama_produk'];
    harga_produk.text = widget.Listdata['harga_produk'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('id_produk'),
              subtitle: Text(widget.Listdata['id_produk']),
            ),
            ListTile(
              title: Text('nama_produk'),
              subtitle: Text(widget.Listdata['nama_produk']),
            ),
            ListTile(
              title: Text('harga_produk'),
              subtitle: Text(widget.Listdata['harga_produk']),
            ),
          ],
        ),
      ),
    );
  }
}