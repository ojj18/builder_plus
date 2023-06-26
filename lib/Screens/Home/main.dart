import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/Screens/Settings/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          },
          iconSize: 30,
          icon: const Icon(Icons.settings),
        ),
        centerTitle: true,
        title: const Text(
          "Builder Pluss",
          style: LightTheme.header,
        ),
      ),
      body:const Center(child: Text("Under development"))

    );
  }
}
