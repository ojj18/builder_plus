import 'package:builder_plus/Screens/Home/main.dart';
import 'package:builder_plus/Screens/Project/main.dart';
import 'package:builder_plus/Screens/Quotation/main.dart';
import 'package:builder_plus/Screens/Report/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.folder,
                      color: Colors.white,
                      size: 30,
                    )),
              
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      FontAwesome5Regular.file,
                      color: Colors.white,
                      size: 30,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      FontAwesome.line_chart,
                      color: Colors.white,
                      size: 30,
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
