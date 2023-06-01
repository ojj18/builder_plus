import 'package:builder_plus/Common/constant.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Settings",
          style: LightTheme.header,
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     iconSize: 24,
        //     icon: const Icon(Icons.list),
        //   ),
        // ],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            height: height*0.70,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [],)

              ],
            ),
          )
        ],
      ),
    );
  }
}
