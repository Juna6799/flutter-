import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lat8/Tambah_Produk.dart';
import 'package:lat8/Ubah_Produk.dart';
import 'package:lat8/Detail_Produk.dart';

class HalamanProduk extends StatefulWidget {
  const HalamanProduk({super.key});

  @override
  State<HalamanProduk> createState() => _HalamanProdukState();
}

class _HalamanProdukState extends State<HalamanProduk> {
  List _listdata = [];
  bool _loading = true;

  Future _getData() async {
    try {
      final respon = await http.get(
        Uri.parse('http://localhost/produk/read.php'),
      );
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          _listdata = data;
          _loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _deleteProduk(String idProduk) async {
    try {
      final respon = await http.post(
        Uri.parse('http://localhost/produk/delete.php'),
        body: {'id_produk': idProduk},
      );
      if (respon.statusCode == 200) {
        setState(() {
          _listdata.removeWhere((item) => item['id_produk'] == idProduk);
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Produk berhasil berhapus')));
      } else {
        throw Exception('Gagal menghapus produk');
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Terjadi Kesalahan')));
    }
  }

  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Produk'),
        backgroundColor: Colors.lightBlue,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProduk(
                            Listdata: {
                              'id_produk': _listdata[index]['id_produk'],
                              'nama_produk': _listdata[index]['nama_produk'],
                              'harga_produk':
                                  _listdata[index]['harga_produk'],
                            },
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(_listdata[index]['nama_produk'].toString()),
                      subtitle: Text(_listdata[index]['harga_produk']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UbahProduk(
                                    Listdata: {
                                          'id_produk':
                                          _listdata[index]['id_produk'],
                                          'nama_produk':
                                          _listdata[index]['nama_produk'],
                                          'harga_produk':
                                          _listdata[index]['harga_produk'],
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Hapus Data"),
                                  content: Text(
                                    'Apakah mau menghapus product ini.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _deleteProduk(
                                          _listdata[index]['id_produk'],
                                        );
                                      },
                                      child: Text("Hapus"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        child: Text('+', style: TextStyle(fontSize: 20)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahProduk()),
          );
        },
      ),
    );
  }
}