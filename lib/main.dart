import 'dart:async';

import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/splash_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/SignIn/main.dart';

main() {
  runApp(const BuilderPlusApp());
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

//MyHomeScreen
class BuilderPlusApp extends StatelessWidget {
  const BuilderPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomeScreen(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: headerColor,
          ),
          primaryColor: primaryColor),
    );
  }
}
