import 'package:flutter/material.dart';
import 'package:louajet_web/screens/landing_page.dart';
import 'package:louajet_web/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Loua'Jet",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ConstantColors.louageRed),
        useMaterial3: true,
      ),
      home: LandingPage(),
    );
  }
}
