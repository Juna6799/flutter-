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
      title: 'Menu Navigasi',
      home: HomePage(),
      routes: {
        '/about':(context) =>AboutPage(),
        '/contact':(context) =>ContactPage(),
        '/galery':(context) =>GaleryPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valentino Menu Navigasi'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 115, 173, 22)
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Beranda'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Info Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/galery');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Halaman Beranda'),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata & Deskripsi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/valen.jpg'),
                ),
              ),
              SizedBox(height: 20),
              Text('Nama: Valentino', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Tempat, Tanggal Lahir: Jakarta, 24 Juni 2008', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Alamat: Cawang III No.17, Jakarta Timur, DKI Jakarta', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Jenis Kelamin: Laki-laki', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Agama: Islam', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Status: Mahasiswa', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text(
                'Deskripsi Singkat:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Saya adalah seorang Pelajar dan bersekolah di SMK Negeri 64 Jakarta. '
                'Saya belajar hal selama di sekolah yaitu html, css, javasript, database, C#, Java dll. '
                'Saya suka belajar hal baru dan berusaha untuk meningkatkan kemampuan saya secara terus-menerus. '
                'Selain aktif belajar coding, Saya juga aktif di kegiatan ekstrakurikuler Paskibra di SMK Negeri 64 Jakarta.'
                'Saya juga mengikuti organisasi sepertiRohkris, dan saya sebagai Ketua Rohkris di SMKN 64. '
                'Harapan saya adalah bisa menjadi Application Security Developer profesional dan cita cita menjadi BUMN bidang teknologi dan Perwira TNI.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Kami'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text('Nomor Telepon'),
              subtitle: Text('+62 812 1111 23330'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.purple),
              title: Text('Instagram'),
              subtitle: Text('@junhaean'),
            ),
          ],
        ),
      ),
    );
  }
}


class GaleryPage extends StatelessWidget {
  const GaleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galerry Saya'),
      ),  
      body: Center(
        child: Text('Halaman Gallery Saya'),
      ),
    );
  }
}