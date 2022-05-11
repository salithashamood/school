import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/components/widget_components.dart';
import 'package:school/utils/image.dart';
import 'package:sizer/sizer.dart';

import '../controllers/login_controller.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  final _loginController = Get.find<LoginController>();
  final formkey = GlobalKey<FormState>();

  bool isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loginPageImage(mobileLoginBg, false),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(top: 0, right: 18, left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: loginText(),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                // key: formkey,
                key: _loginController.formkey.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.transparent,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          key: const Key('user name'),
                          validator: EmailFieldValidator.validate,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Email can\'t be empty';
                          //   }
                          //   return null;
                          // },
                          controller: _loginController.userName.value,
                          decoration: userNameInputDecoration(),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.transparent,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          validator: PasswordFieldValidator.validate,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Password can\'t be empty';
                          //   }
                          //   return null;
                          // },
                          obscureText: !isVisiblePassword,
                          controller: _loginController.password.value,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                isVisiblePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isVisiblePassword = !isVisiblePassword;
                                });
                              },
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            hintText: 'Password',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.transparent,
                        width: 100.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            forgotPasswordButton(),
                            // ),
                            // SizedBox(
                            //   width: 1.w,
                            // ),
                            loginButton(14.w),
                            // login(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  login() {
    return ElevatedButton(
      key: const Key('login1'),
      style: ElevatedButton.styleFrom(
        primary: const Color(0XFF2743FF),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        if (formkey.currentState!.validate()) {
          _loginController.logIn(isTest: false);
        } 
        // if (_loginController.formkey.value.currentState!.validate()) {
        //   if (GetUtils.isEmail(_loginController.userName.value.text)) {
        //     _loginController.logIn(isTest: false);
        //   } else {
        //     Get.snackbar('Not a valid user name', 'Enter valid user name');
        //   }
        // }
      },
    );
  }
}

class EmailFieldValidator {
  static String? validate(String? value) {
    return value!.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String? validate(String? value) {
    return value!.isEmpty ? 'Password can\'t be empty' : null;
  }
}
