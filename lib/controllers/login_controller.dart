import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school/utils/user_secure_storage.dart';

import '../screens/home_page.dart';

class LoginController extends GetxController {
  var userName = TextEditingController().obs;
  var password = TextEditingController().obs;
  var isLoading = false.obs;
  final formkey = GlobalKey<FormState>().obs;

  Future<void> logIn() async {
    isLoading.value = true;
    var loginData = {
      'Username': userName.value.text,
      'Password': password.value.text
      // 'Username': "superadmin@assethub.com.au",
      // 'Password': "qazwsx1-2/"
    };

    try {
      final response = await http.post(
        Uri.parse('https://dev.api.cams.assethub.com.au/api/Users/signin'),
        body: jsonEncode(loginData),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        final body = jsonDecode(response.body);
        await UserSecureStorage.setJwtToken(body['jwtToken']);
        await UserSecureStorage.setRefreshToken(body['refreshToken']);
        Get.off(const HomePage());
      } else {
        isLoading.value = false;
        Get.snackbar(
          'User name or password incorect',
          'Check user name and password',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
