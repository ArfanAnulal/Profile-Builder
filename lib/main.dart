import 'package:flutter/material.dart';
import 'package:profile_builder/pages/homepage.dart';
import 'package:profile_builder/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Builder',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkMode,
      home: const MyHomePage(),
    );
  }
}

