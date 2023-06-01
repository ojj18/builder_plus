import 'package:builder_plus/Screens/Quotation/create_quotation.dart';
import 'package:builder_plus/Screens/Settings/main.dart';
import 'package:flutter/material.dart';

import '../../Common/constant.dart';

class QuotationListScreen extends StatefulWidget {
  const QuotationListScreen({super.key});

  @override
  State<QuotationListScreen> createState() => _QuotationListScreenState();
}

class _QuotationListScreenState extends State<QuotationListScreen> {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          },
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateQuotationScreen()),
              );
            },
            iconSize: 24,
            icon: const Image(
              image: AssetImage("assets/icons/file-add.png"),
              height: 25,
              width: 24,
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ProjectViewScreen()),
          // );
        },
        child: Container(
          width: width,
          height: height * 0.25,
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: cardBackgroundColor,
            elevation: 10.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('RVKS - Quotation',
                          style: LightTheme.subHeader5),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Image(
                              image: AssetImage("assets/icons/visible.png"),
                              height: 18,
                              width: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Image(
                              image: AssetImage("assets/icons/edit.png"),
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  subtitle:
                      const Text('12-05-2023', style: LightTheme.subHeader6),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Total Area: 5222Sq.ft',
                        style: LightTheme.subHeader6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: List.generate(
                        500 ~/ 5,
                        (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : Colors.grey.shade400,
                                height: 2,
                              ),
                            )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: const [
                            Image(
                              image: AssetImage("assets/icons/clock.png"),
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "6 Months",
                              style: LightTheme.subHeader6,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Image(
                              image: AssetImage("assets/icons/debit.png"),
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "35Lkhs",
                              style: LightTheme.subHeader6,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
