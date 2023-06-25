
import 'package:builder_plus/Services/api/main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Common/constant.dart';



class SignInRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  SignInRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> signin(String? email, String? password) async {
    return await apiClient
        .postData(
          uri, {"username": email, "password": password});
  }

  Future<Response> isUserToken() async {
    return await apiClient.postData(uri, LightTheme.userToken);
  }

  Future<Response> getUserData() async {
    return await apiClient.getData("$uri/", LightTheme.userToken);
  }

  bool userLoggedIn() {
    getUserToken();

    return sharedPreferences.containsKey("userToken");
  }

  Future<String> getUserToken() async {
    LightTheme.userToken =
        sharedPreferences.getString("userToken") ?? "None";
    return sharedPreferences.getString("userToken") ?? "None";
  }

  saveuserToken(String token) async {
    return await sharedPreferences.setString("userToken", token);
  }
}
