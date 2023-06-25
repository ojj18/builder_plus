import 'dart:async';

import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/route/main.dart';
import 'package:builder_plus/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Services/controller/signinController/main.dart';
import 'helper/dependencies.dart' as dept;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dept.init();
  runApp(const BuilderPlusApp());
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Get.find<SignInController>().userLoggedIn()
          ? RouteSetting.bottomNav
          : RouteSetting.login,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

//MyHomeScreen
class BuilderPlusApp extends StatelessWidget {
  const BuilderPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: Get.find<SignInController>().userLoggedIn()
          ? RouteSetting.bottomNav
          : RouteSetting.login,
           getPages: RouteSetting.routeList,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: headerColor,
          ),
          primaryColor: primaryColor),
    );
  }
}
