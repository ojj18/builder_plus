import 'package:flutter/material.dart';

import '../../Common/constant.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
          "Report",
          style: LightTheme.header,
        ),
      ),
    );
  }
}
