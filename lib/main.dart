import 'package:flutter/material.dart';
import 'package:belajar_flutter/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Menu',
      debugShowCheckedModeBanner: false, // Menghilangkan pita debug
      home: LoginPage(), // Halaman pertama kali dibuka adalah Login
    );
  }
}