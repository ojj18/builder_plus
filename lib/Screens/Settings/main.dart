import 'package:builder_plus/Common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../route/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Settings",
          style: LightTheme.header,
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     iconSize: 24,
        //     icon: const Icon(Icons.list),
        //   ),
        // ],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height * 0.70,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: height*0.07,),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.grey,
                  child: SizedBox(
                    height: height * 0.05,
                    width: width,
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/icons/profile.png"),
                          height: 24.0,
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Profile ',
                          style: LightTheme.subHeader8,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.grey,
                  child: SizedBox(
                    height: height * 0.05,
                    width: width,
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/icons/addvender.png"),
                          height: 24.0,
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Add Vender',
                          style: LightTheme.subHeader8,
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.grey,
                  child: SizedBox(
                    height: height * 0.05,
                    width: width,
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/icons/payments.png"),
                          height: 24.0,
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Payments',
                          style: LightTheme.subHeader8,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                InkWell(
                  onTap: () {},
                  splashColor: Colors.grey,
                  child: SizedBox(
                    height: height * 0.05,
                    width: width,
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/icons/person.png"),
                          height: 24.0,
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Contact Us ',
                          style: LightTheme.subHeader8,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.grey,
                  child: SizedBox(
                    height: height * 0.05,
                    width: width,
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/icons/aboutus.png"),
                          height: 24.0,
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'About Us',
                          style: LightTheme.subHeader8,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.grey,
                  child: SizedBox(
                    height: height * 0.05,
                    width: width,
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/icons/UserShield.png"),
                          height: 24.0,
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Privacy Policy ',
                          style: LightTheme.subHeader8,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, bottom: 50.0),
            child: InkWell(
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                Get.toNamed(RouteSetting.login);
              },
              splashColor: Colors.grey,
              child: SizedBox(
                height: height * 0.05,
                width: width,
                child: const Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/Logout.png"),
                      height: 24.0,
                      width: 28.0,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Log Out',
                      style: LightTheme.subHeader8,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
