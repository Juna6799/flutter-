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
      title: 'Pariwisata Danau Toba',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) => const MenuPage(
              menuTitle: 'Pantai',
              icon: Icons.beach_access,
              description:
                  'Danau Toba adalah danau vulkanik terbesar di Indonesia, bahkan di Asia Tenggara, yang terletak di Provinsi Sumatera Utara. Danau ini memiliki panjang sekitar 100 kilometer, lebar 30 kilometer, dan kedalaman mencapai lebih dari 500 meter. Luasnya yang sangat besar membuatnya tampak seperti lautan di tengah pulau Sumatera.'
                  'Danau Toba memiliki sejumlah pantai yang menawan di sekitar tepiannya. Pantai-pantai ini menyuguhkan pasir putih yang halus dan air danau yang jernih serta tenang. Salah satu yang paling terkenal adalah Pantai Pasir Putih Parbaba di Pulau Samosir. Pengunjung bisa berenang, bermain perahu, atau sekadar duduk santai menikmati udara sejuk sambil melihat panorama danau yang dikelilingi bukit hijau. Pantai-pantai di Danau Toba menjadi tempat favorit untuk rekreasi keluarga dan fotografi alam.',
              imageAsset: 'assets/images/danau.jpg',
            ),
        '/kuliner': (context) => const MenuPage(
              menuTitle: 'Kuliner',
              icon: Icons.restaurant,
              description:
                  'Arsik adalah salah satu hidangan tradisional khas masyarakat Batak Toba di Sumatera Utara. Hidangan ini terkenal dengan cita rasa khas yang kuat, pedas, dan aromatik, hasil perpaduan berbagai rempah-rempah lokal yaitu Andaliman, Kunyit, Lengkuas, Kemiri, Bawang Merah & Bawang Putih, Serai, Asam cikala (buah kecombrang muda) dll. Arsik biasanya menggunakan ikan mas sebagai bahan utama, meskipun bisa juga dimasak dengan ikan nila, ayam, atau daging lainnya. '
                  'Arsik bukan sekadar makanan, tetapi juga bagian penting dalam berbagai acara adat Batak, seperti pernikahan, kelahiran, atau acara syukuran. Dalam tradisi, penyajian arsik bisa melambangkan doa dan harapan untuk kehidupan yang baik.',
              imageAsset: 'assets/images/arsik.jpg',
            ),
        '/budaya': (context) => const MenuPage(
              menuTitle: 'Budaya',
              icon: Icons.museum,
              description:
                  'Danau Toba merupakan pusat budaya masyarakat Batak, salah satu suku terbesar di Sumatera Utara. Wisatawan bisa mengenal lebih dekat tradisi Batak melalui rumah adat rumah Bolon, pertunjukan tarian tradisional seperti Tortor, dan berbagai upacara adat yang kental akan nilai-nilai kekeluargaan dan spiritualitas. Di Pulau Samosir, terdapat banyak desa wisata seperti Tomok dan Ambarita yang menyuguhkan pengalaman budaya langsung, termasuk melihat situs-situs bersejarah seperti batu persidangan dan makam Raja Sidabutar.',
              imageAsset: 'assets/images/bolon.jpg',
            ),
        '/alat musik': (context) => const MenuPage(
              menuTitle: 'Alat Musik',
              icon: Icons.music_note,
              description:
              'Godang adalah alat musik tradisional khas suku Batak dari Sumatera Utara yang termasuk dalam jenis gendang atau drum. Alat musik ini berbentuk tabung panjang yang terbuat dari kayu dan memiliki membran dari kulit binatang, biasanya kulit kambing, yang menutupi salah satu atau kedua ujungnya. Kulit tersebut dikencangkan agar menghasilkan suara yang nyaring dan khas ketika dipukul. Godang biasanya dimainkan dengan tangan atau menggunakan stik kecil, berperan penting dalam mengatur ritme musik tradisional Batak. Alat musik ini sering digunakan dalam berbagai acara adat, pertunjukan seni, dan upacara keagamaan sebagai pengiring tarian dan nyanyian, sehingga menjadi bagian penting dalam budaya dan tradisi masyarakat Batak.',
              imageAsset: 'assets/images/godang.jpg',
            ),
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
        title: const Text('Pariwisata Danau Toba'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          children: [
            _buildMenuCard(
              context,
              title: 'Pantai',
              icon: Icons.beach_access,
              routeName: '/pantai',
              color: Colors.lightBlue,
            ),
            _buildMenuCard(
              context,
              title: 'Kuliner',
              icon: Icons.restaurant,
              routeName: '/kuliner',
              color: Colors.orangeAccent,
            ),
            _buildMenuCard(
              context,
              title: 'Budaya',
              icon: Icons.museum,
              routeName: '/budaya',
              color: Colors.deepPurpleAccent,
            ),
            _buildMenuCard(
              context,
              title: 'Alat Musik',
              icon: Icons.music_note,
              routeName: '/alat musik',
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required String title,
      required IconData icon,
      required String routeName,
      required Color color}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          shape: const CircleBorder(),
          elevation: 6,
          color: color,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 40, color: Colors.white),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;
  final String imageAsset;
  final String description;

  const MenuPage({
    super.key,
    required this.menuTitle,
    required this.icon,
    required this.description,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              menuTitle,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Icon(icon, size: 100, color: Colors.teal),
            const SizedBox(height: 20),
            Image.asset(
              imageAsset,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back), 
              label: const Text('Kembali'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
