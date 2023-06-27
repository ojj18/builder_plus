import 'package:builder_plus/Screens/Project/create_project.dart';
import 'package:builder_plus/Screens/Project/view_project.dart';
import 'package:builder_plus/Screens/Settings/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/constant.dart';
import '../../route/main.dart';

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () {
         Get.offAllNamed(RouteSetting.bottomNav);
        return Future.value(true);
      },
      child: Scaffold(
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
            iconSize: 30,
           icon: const Icon(Icons.menu),
          ),
          centerTitle: true,
          title: const Text(
            "Projects",
            style: LightTheme.header,
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const CreateProjectScreen()),
          //       );
          //     },
          //     icon: const Image(
          //       image: AssetImage("assets/icons/folder-add.png"),
          //       height: 20,
          //       width: 25,
          //     ),
          //   ),
          // ],
        ),
        backgroundColor: backgroundColor,
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProjectViewScreen()),
                );
              },
              child: Container(
                width: width,
                height: height * 0.20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: cardBackgroundColor,
                  elevation: 10.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ListTile(
                        title: Text('RVKS Construction',
                            style: LightTheme.subHeader5),
                        subtitle: Text('Laoern ipsum dolor sit amet constar elit',
                            style: LightTheme.subHeader6),
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
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
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
                                children: [
                                  Image(
                                    image: AssetImage("assets/icons/credit.png"),
                                    height: 25,
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "10Lkhs/35Lkhs",
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
            );
          }),
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
