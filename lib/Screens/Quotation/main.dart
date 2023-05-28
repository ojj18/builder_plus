import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../Common/constant.dart';

class QuotationListScreen extends StatefulWidget {
  const QuotationListScreen({super.key});

  @override
  State<QuotationListScreen> createState() => _QuotationListScreenState();
}

class _QuotationListScreenState extends State<QuotationListScreen> {
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
          "Quotation",
          style: LightTheme.header,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 24,
            icon: const Icon(FontAwesome5Solid.file_medical),
          ),
        ],
      ),
    );
  }
}
