import 'package:builder_plus/Common/constant.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: headerColor,
          ),
          primaryColor: primaryColor),
    );
  }
}
