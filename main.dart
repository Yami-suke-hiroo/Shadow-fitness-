import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(ShadowFitnessApp());
}

class ShadowFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shadow Fitness',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
      },
    );
  }
}
