import 'package:builder_plus/Screens/Home/main.dart';
import 'package:builder_plus/Screens/Project/main.dart';
import 'package:builder_plus/Screens/Quotation/main.dart';
import 'package:builder_plus/Screens/Report/main.dart';
import 'package:flutter/material.dart';

import '../../Common/constant.dart';
import '../button/main.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> screens = [];
  int selectedIndex = 0;
  bool isCreditEnable = true;
  bool isDebitEnable = false;

  @override
  void initState() {
    screens = const [
      HomeScreen(),
      ProjectListScreen(),
      QuotationListScreen(),
      ReportScreen()
    ];
    super.initState();
  }

  void selectedScreen(int? index) {
    setState(() {
      selectedIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: primaryColor),
            child: BottomNavigationBar(
              onTap: selectedScreen,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              items: const [
                BottomNavigationBarItem(
                    label: "",
                    icon: Image(
                      image: AssetImage("assets/icons/home.png"),
                      height: 40,
                      width: 40,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.only(right: 50.0),
                      child: Image(
                        image: AssetImage("assets/icons/project.png"),
                        height: 30,
                        width: 30,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Image(
                        image: AssetImage("assets/icons/file-edit.png"),
                        height: 30,
                        width: 30,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Image(
                      image: AssetImage("assets/icons/chart.png"),
                      height: 40,
                      width: 40,
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 500,
                  child: StatefulBuilder(builder: (context, setState) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isDebitEnable = false;
                                        isCreditEnable = true;
                                      });
                                    },
                                    child: Material(
                                      elevation: isCreditEnable ? 10.0 : 0.0,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                      )),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        decoration: const BoxDecoration(
                                            color: creditColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                            )),
                                        child: const Center(
                                            child: Text(
                                          "Income(Credit)",
                                          style: LightTheme.subHeader2,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isCreditEnable = false;
                                        isDebitEnable = true;
                                      });
                                    },
                                    child: Material(
                                      elevation: isDebitEnable ? 10.0 : 0.0,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25),
                                      )),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        decoration: const BoxDecoration(
                                            color: debitColor,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                            )),
                                        child: const Center(
                                            child: Text("Expense(Debit)",
                                                style: LightTheme.subHeader2)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          child: Column(
                                            children: const [
                                              Text("RVKS Construction")
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              readOnly: true,
                              decoration: const InputDecoration(
                                hintText: 'Project Name',
                                hintStyle: LightTheme.subHeader7,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff8F70FF)),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Name',
                                      hintStyle: LightTheme.subHeader7,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff8F70FF)),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Amount',
                                      hintStyle: LightTheme.subHeader7,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff8F70FF)),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Balance',
                                  hintStyle: LightTheme.subHeader7,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff8F70FF)),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: formFieldColor.withOpacity(0.2),
                                hintText: 'Describe Here...',
                                hintStyle: LightTheme.subHeader7,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IntrinsicWidth(
                                    child: CommonButton(
                                  onButtonTap: () {
                                    Navigator.pop(context);
                                  },
                                  radius: 20,
                                  height: 30,
                                  width: 100,
                                  fontSize: fontSize12,
                                  gapWidth: 0,
                                  backgroundColor: buttonColor,
                                  buttonText: "Submit",
                                )),
                                const SizedBox(
                                  width: 50.0,
                                ),
                                IntrinsicWidth(
                                    child: CommonButton(
                                  onButtonTap: () {
                                    Navigator.pop(context);
                                  },
                                  radius: 20,
                                  height: 30,
                                  width: 100,
                                  fontSize: fontSize12,
                                  gapWidth: 0,
                                  backgroundColor: secondaryColor,
                                  buttonText: "Cancel",
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              });
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
