import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,// menyesuaikan kerapatan elemen UI sesuai platform
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final TextEditingController usernameController = TextEditingController();
 final TextEditingController passwordController =TextEditingController();
  
  void login (){
    String Username = usernameController.text;
    String Passowrd = passwordController.text;
    
    // logika untuk login  sederhana

    if( Username == "Juna" && Passowrd == "Juna22"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        );
    } else {
      // pesan error username atau password tidak sesuai

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("PASSWORD ATAU USERNAME SALAH DIMASUKKKAN"))
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username'
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password'
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: login, 
                child: const Text('Login')
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: const Center(
        child: Text(
          "WELCOME TO MY HOMEPAGE",
          style: TextStyle(fontSize: 25),          
        ),
      ),
    );
  }
}
