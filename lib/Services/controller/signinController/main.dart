import 'package:builder_plus/Common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/custom_alert_box.dart';
import '../../../helper/models/errorModel/main.dart';
import '../../../helper/models/userModel/main.dart';
import '../../../route/main.dart';
import '../../repository/signinRepository/main.dart';

class SignInController extends GetxController implements GetxService {
  final SignInRepo signInRepo;

  SignInController({
    required this.signInRepo,
  });
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String userName = "";

  UserModel userModel = UserModel();

  signIn(String? userName, String? password) async {
    _isLoading = true;
    update();
    Response response = await signInRepo.signin(userName, password);
    if (response.statusCode == 200) {
      signInRepo.saveuserToken(response.body['access']);
      userModel = UserModel.fromJson(response.body);

      showAlertBox(70, Icons.check_circle, primaryColor, "Success",
          "Signin successfully", () {
        Navigator.pop(Get.context!);
        Get.toNamed(RouteSetting.bottomNav);
      });
    } else {
      ErrorModel errorModel = ErrorModel();
      errorModel = ErrorModel.fromJson(response.body);
      showAlertBox(
          70,
          Icons.info,
         secondaryColor,
          "Error",
         errorModel.detail ,
          () {});
    }
    _isLoading = false;
    update();
  }

  getUserData() async {
    signInRepo.getUserToken();
    Response response = await signInRepo.getUserData();
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(response.body);
      }
      update();
    } else {
      ErrorModel errorModel = ErrorModel();
      errorModel = ErrorModel.fromJson(response.body);
      showAlertBox(
          70, Icons.info, Colors.redAccent, "Error", errorModel.detail, () {});
    }
  }

  bool userLoggedIn() {
    signInRepo.getUserToken();
    return signInRepo.userLoggedIn();
  }
}
