import 'package:flutter/material.dart';

import 'Screens/SignIn/main.dart';

main() {
  runApp(const BuilderPlusApp());
}

class BuilderPlusApp extends StatefulWidget {
  const BuilderPlusApp({super.key});

  @override
  State<BuilderPlusApp> createState() => _BuilderPlusAppState();
}

class _BuilderPlusAppState extends State<BuilderPlusApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
