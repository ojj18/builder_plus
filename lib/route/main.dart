import 'package:builder_plus/Screens/SignIn/main.dart';
import 'package:get/get.dart';

import '../Component/bottom/main.dart';
import '../main.dart';

class RouteSetting {
  //RouteNames
  static String login = "/Login";
  static String bottomNav = "/BottomNav";
   static String homeScreen = "/Home";

  //RouteMethods
 static String getLogin() => login;
  static String getBottomNav() => bottomNav;
    static String getHome() => homeScreen;

  //RouteList

  static List<GetPage> routeList = [
    GetPage(
        name: bottomNav,
        page: () => const BottomNav(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500)),
   GetPage(
        name: login,
        page: () => const MyHomeScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
