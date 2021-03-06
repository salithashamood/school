import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/components/widget_components.dart';

import '../controllers/login_controller.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  final _loginController = Get.find<LoginController>();

  bool isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loginPageImage('assets/images/phone_login_bg.png', size, false),
        const SizedBox(
          height: 10,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email can\'t be empty';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can\'t be empty';
                            }
                            return null;
                          },
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
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            forgotPasswordButton(),
                            // ),
                            const SizedBox(
                              width: 15,
                            ),
                            loginButton(60),
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
}
