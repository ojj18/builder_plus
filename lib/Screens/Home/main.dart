import 'package:builder_plus/Common/constant.dart';
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
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.settings),
        ),
        centerTitle: true,
        title: const Text(
          "Builder Pluss",
          style: LightTheme.header,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Card
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Today",
                                  style: LightTheme.subHeader1,
                                ),
                              ),
                            ),
                            const Text(
                              "Total Balance",
                              style: LightTheme.subHeader,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "38776.0",
                                  style: LightTheme.subHeader,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "INR",
                                  style: LightTheme.subHeader1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.75,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_downward,
                                              color: Colors.green.shade400,
                                            ),
                                            const Text(
                                              "Income",
                                              style: LightTheme.subHeader1,
                                            )
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Text(
                                            "4000.0",
                                            style: LightTheme.subHeader2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: Colors.white,
                                    thickness: 2.5,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_upward,
                                              color: Colors.red.shade400,
                                            ),
                                            const Text(
                                              "Expense",
                                              style: LightTheme.subHeader1,
                                            )
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Text(
                                            "1224.0",
                                            style: LightTheme.subHeader2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      //List of transactions
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent transactions",
                            style: LightTheme.header3,
                          ),
                          Text(
                            "See all",
                            style: LightTheme.header2,
                          )
                        ],
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
                                Row(
                                  children: List.generate(
                                      500 ~/ 10,
                                      (index) => Expanded(
                                            child: Container(
                                              color: index % 2 == 0
                                                  ? Colors.transparent
                                                  : Colors.grey.shade400,
                                              height: 2,
                                            ),
                                          )),
                                ),
                              ],
                            );
                          })),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
   
    );
  }
}
