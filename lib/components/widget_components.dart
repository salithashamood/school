import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/login_controller.dart';

loginPageImage(String path,bool isTablet) {
  return Container(
    width: 100.w,
    // height: size.height * 0.45,
    height: 55.h,
    child: Image.asset(
      path,
      fit: SizerUtil.deviceType == DeviceType.mobile
          ? BoxFit.fill
          : BoxFit.cover,
    ),
    decoration: isTablet
        ? BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            border: Border.all(
              style: BorderStyle.solid,
              color: Colors.blue,
              width: 4,
            ),
          )
        : const BoxDecoration(),
  );
}

loginText() {
  return const Text(
    'Login',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
}

loginButton(double paddin) {
  final _loginController = Get.find<LoginController>();
  return Obx(
    () => ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0XFF2743FF),
        padding: EdgeInsets.symmetric(horizontal: paddin, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: _loginController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : const Text(
              'Login',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
      onPressed: _loginController.isLoading.value
          ? () {}
          : () {
              if (_loginController.formkey.value.currentState!.validate()) {
                if (GetUtils.isEmail(_loginController.userName.value.text)) {
                  _loginController.logIn();
                } else {
                  Get.snackbar(
                      'Not a valid user name', 'Enter valid user name');
                }
              }
              // print(_loginController.userName.value.text);
              // print(_loginController.password.value.text);
            },
    ),
  );
}

forgotPasswordButton() {
  return TextButton(
    onPressed: () {},
    child: const Text(
      'Forgot password ?',
      style: TextStyle(
          color: Color(0XFF2743FF), fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

userNameInputDecoration() {
  return InputDecoration(
    fillColor: Colors.grey[200],
    filled: true,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    hintText: 'User Name',
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
