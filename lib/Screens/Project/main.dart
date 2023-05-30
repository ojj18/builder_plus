// ignore_for_file: prefer_const_constructors

import 'package:builder_plus/Screens/Project/create_project.dart';
import 'package:builder_plus/Screens/Project/view_project.dart';
import 'package:flutter/material.dart';

import '../../Common/constant.dart';

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
          "Projects",
          style: LightTheme.header,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateProjectScreen()),
              );
            },
            icon: Image(
              image: AssetImage("assets/icons/folder-add.png"),
              height: 20,
              width: 25,
            ),
          ),
        ],
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
                MaterialPageRoute(builder: (context) => ProjectViewScreen()),
              );
            },
            child: Container(
              width: width,
              height: height * 0.20,
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
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
    );
  }
}
