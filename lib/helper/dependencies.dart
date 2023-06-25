import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/api/main.dart';
import '../Services/controller/signinController/main.dart';
import '../Services/repository/signinRepository/main.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient());

  //get repositorys

  Get.lazyPut(
      () => SignInRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //get controllers

  Get.lazyPut(() => SignInController(signInRepo: Get.find()));
}
