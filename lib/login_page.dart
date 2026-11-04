import 'package:flutter/material.dart';
// PERHATIKAN: Sesuaikan 'belajar_flutter' dengan nama project kamu
import 'package:belajar_flutter/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk menyimpan username
  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  // Fungsi untuk membuat input form
  showInput(namacontroller, placeholder, isPassword) {
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  // Fungsi untuk menampilkan alert/dialog
  _showDialog(String message, Widget targetPage) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Info"),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                // Pindah ke halaman tujuan
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => targetPage),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showInput(_usernameController, 'Masukkan Username', false),
            const SizedBox(height: 10),
            showInput(_passwordController, 'Masukkan Password', true),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  _saveUsername();
                  _showDialog('Anda Berhasil Login', const HomePage());
                } else {
                  _showDialog('Username dan Password Salah', const LoginPage());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}