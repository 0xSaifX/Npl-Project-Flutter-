import 'package:figma/npl_theme.dart';
import 'package:figma/screens/npl_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NPLApp());
}

class NPLApp extends StatelessWidget {
  const NPLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NPL Marketing Platform',
      theme: NPLTheme.lightTheme,
      home: const NPLHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
