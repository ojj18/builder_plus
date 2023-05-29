import 'package:builder_plus/Screens/Home/main.dart';
import 'package:builder_plus/Screens/Project/main.dart';
import 'package:builder_plus/Screens/Quotation/main.dart';
import 'package:builder_plus/Screens/Report/main.dart';
import 'package:flutter/material.dart';

import '../../Common/constant.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> screens = [];
  int selectedIndex = 0;

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
        onPressed: () {},
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
