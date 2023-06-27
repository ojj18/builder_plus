import 'package:builder_plus/Screens/Quotation/create_quotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../Common/constant.dart';

class QuotationViewScreen extends StatefulWidget {
  const QuotationViewScreen({super.key});

  @override
  State<QuotationViewScreen> createState() => _QuotationViewScreenState();
}

class _QuotationViewScreenState extends State<QuotationViewScreen> {
  bool isQuantityEnable = false;
  bool isCostEnable = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
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
          centerTitle: true,
          title: const Text(
            "Quotation",
            style: LightTheme.header,
          ),
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(15.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "RVKS - Quotation",
                                  style: LightTheme.subHeader5,
                                ),
                                Text(
                                  "Area :5222 per sft",
                                  style: LightTheme.subHeader4,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Image(
                                    image: AssetImage("assets/icons/edit.png"),
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Image(
                                    image:
                                        AssetImage("assets/icons/download.png"),
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isQuantityEnable = !isQuantityEnable;
                                });
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )),
                                child: isQuantityEnable
                                    ? const Center(
                                        child: Icon(
                                        FontAwesome.check,
                                        size: 16,
                                        color: Colors.black,
                                      ))
                                    : const SizedBox.shrink(),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Hide quantity of works",
                              style: LightTheme.subHeader4,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isCostEnable = !isCostEnable;
                                });
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )),
                                child: isCostEnable
                                    ? const Center(
                                        child: Icon(
                                        FontAwesome.check,
                                        size: 16,
                                        color: Colors.black,
                                      ))
                                    : const SizedBox.shrink(),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Hide Item cost",
                              style: LightTheme.subHeader4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Extimated cost",
                              style: LightTheme.subHeader4,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Rs 25,847576",
                              style: LightTheme.subHeader5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateQuotationScreen()),
            );
          },
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
