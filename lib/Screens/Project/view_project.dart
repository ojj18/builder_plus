import 'package:builder_plus/Component/button/main.dart';
import 'package:builder_plus/Screens/Project/create_project.dart';
import 'package:flutter/material.dart';

import '../../Common/constant.dart';
import '../Quotation/view_quotation.dart';

class ProjectViewScreen extends StatefulWidget {
  const ProjectViewScreen({super.key});

  @override
  State<ProjectViewScreen> createState() => _ProjectViewScreenState();
}

class _ProjectViewScreenState extends State<ProjectViewScreen> {
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
            "Projects",
            style: LightTheme.header,
          ),
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 5.0,
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: const Text(""),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "RVKS Construction",
                                        style: LightTheme.header3,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Mohapare, Chennai",
                                        style: LightTheme.subHeader3,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                      child: CommonButton(
                                    radius: 10,
                                    height: 40,
                                    fontSize: fontSize12,
                                    gapWidth: 0,
                                    buttonText: "Download Report",
                                  ))
                                ],
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5.0, left: 20.0, right: 10.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Estimation: 332 Lkhs"),
                                  Text("Date: 27-06-2023"),
                                ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonButton(
                                onButtonTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QuotationViewScreen()));
                                },
                                radius: 10,
                                height: 40,
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                gapWidth: 0,
                                buttonText: "View Quotation",
                              ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              // Expanded(
                              //     child: CommonButton(
                              //   radius: 25,
                              //   height: 50,
                              //   gapWidth: 0,
                              //   buttonText: "Edit Quotation",
                              // ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 5.0,
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Transactions",
                                  style: LightTheme.subHeader4,
                                ),
                                Text(
                                  "View all",
                                  style: LightTheme.header2,
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Friday",
                            style: LightTheme.header2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "29-05-2023",
                            style: LightTheme.subHeader4,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(20),
                                      height: 55,
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IntrinsicWidth(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: NetworkImage(
                                                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Cement"),
                                                    Text("17 Jun 2023"),
                                                    Text("5 quantity * 460 Rs"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: IntrinsicWidth(
                                                  child: Text("INR -1240")))
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              })),
                        ],
                      ),
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
                  builder: (context) => const CreateProjectScreen()),
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
