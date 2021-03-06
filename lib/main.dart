import 'package:flutter/material.dart';
import 'screens/ak_display_screen.dart';

// TODO: Update before release
const String appVersion = "v1.0.0";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayatul Kursi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const AKDisplayScreen(),
    );
  }
}
