
import 'package:flutter/material.dart';

import '../../Common/constant.dart';




class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {},
          iconSize: 24,
          icon: const Icon(Icons.settings),
        ),
        centerTitle: true,
        title: const Text(
          "Projects",
          style: LightTheme.header,
        ),
        actions: [
          IconButton(
          onPressed: () {},
          iconSize: 24,
          icon: const Icon(Icons.create_new_folder),
        ),
        ],
      ),
    );
  }
}