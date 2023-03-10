
import 'package:creativa_poject/pages/home/screen/home_page.dart';
import 'package:creativa_poject/pages/home/screen/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_page',
      routes: {
        "/login_page": (context) => LoginPage(),
        "/home_page": (context) => HomePage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
    );
  }
}
