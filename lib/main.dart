import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ซ่อน Debug Banner
      debugShowCheckedModeBanner: false,

      // ชื่อแอป
      title: 'BMI Calculator',

      // Theme หลักของแอป
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Dunkin',

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),

      // หน้าแรกของแอป
      home: const HomeScreen(),
    );
  }
}
