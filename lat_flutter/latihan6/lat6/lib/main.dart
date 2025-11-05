import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 76, 175, 80),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
      ),
      home: const HomePage(),
      routes: {
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/galery': (context) => const GaleryPage(),
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
        title: const Text('Menu Navigasi & Valentino'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[700],
              ),
              child: const Center(
                child: Text( 'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            _buildDrawerItem(context, Icons.home, 'Beranda', null),
            _buildDrawerItem(context, Icons.info, 'About Me', '/about'),
            _buildDrawerItem(context, Icons.phone, 'Contact Me', '/contact'),
            _buildDrawerItem(context, Icons.image, 'Gallery Me', '/galery'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Beranda', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 60, backgroundImage: AssetImage('assets/images/valen.jpg'),
            ),
            const SizedBox(height: 16),

            const Text(
              'Halo Saya Valentino.\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Portofolio tentang saya, kontak, dan galeri pribadi.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 10),
            _buildInfoCard(Icons.school, 'SMK Negeri 64 Jakarta'),
            _buildInfoCard(Icons.computer, 'Belajar: HTML, CSS, JavaScript, Java, C#'),
            _buildInfoCard(Icons.flag, 'Cita-cita: Application Security Developer & Perwira TNI'),
          ],
        ),
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title, String? route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (route != null) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

  Widget _buildInfoCard(IconData icon, String text) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(text),
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
        title: const Text('Biodata & Deskripsi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,  
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/valen.jpg'),
            ),
            const SizedBox(height: 20),
            _buildInfo('Nama', 'Junaedy Benares Valentino Hutahaean'),
            _buildInfo('Tempat, Tanggal Lahir', 'Jakarta, 24 Juni 2008'),
            _buildInfo('Alamat', 'Cawang III No.17, Jakarta Timur'),
            _buildInfo('Jenis Kelamin', 'Laki-laki'),
            _buildInfo('Agama', 'Kristen'),
            _buildInfo('Status', 'Pelajar'),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Deskripsi Singkat:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Saya adalah seorang pelajar SMK Negeri 64 Jakarta. '
              'Saya mempelajari HTML, CSS, JavaScript, database, C#, dan Java. '
              'Saya senang belajar hal baru dan terus mengembangkan diri. '
              'Di luar pelajaran, saya aktif di ekstrakurikuler Paskibra dan organisasi Rohkris, '
              'bahkan menjabat sebagai Ketua Rohkris di SMKN 64. '
              'Cita-cita saya adalah menjadi Application Security Developer, '
              'dan berkarir di BUMN bidang teknologi, dan menjadi Perwira TNI.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  void _openInstagram() async {
    final Uri url = Uri.parse('https://instagram.com/junhaean');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text('Nomor Telepon'),
                subtitle: const Text('+62 812 1111 23330'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.purple),
                title: const Text('Instagram'),
                subtitle: const Text('@junhaean'),
                trailing: const Icon(Icons.open_in_new, color: Colors.purple),
                onTap: _openInstagram,
              ),
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
    final List<String> imageList = [
      'assets/images/valen.jpg',
      'assets/images/valen2.jpg',
      'assets/images/valen3.jpg',
      'assets/images/valen4.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: imageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                imageList[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
