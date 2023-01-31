import 'package:flutter/material.dart';
import 'package:transdata/Pages/login_page.dart';
import 'Pages/cadatro_page.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alerta Site',
      theme: ThemeData(),
      routes: {
        '/': (context) => const LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
