import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/components/widget_components.dart';
import 'package:school/utils/image.dart';

import '../controllers/login_controller.dart';

class TabletLoginPage extends StatefulWidget {
  const TabletLoginPage({Key? key}) : super(key: key);

  @override
  State<TabletLoginPage> createState() => _TabletLoginPageState();
}

class _TabletLoginPageState extends State<TabletLoginPage> {
  final _loginController = Get.find<LoginController>();

  bool isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loginPageImage(tabletLoginBg, true),
        const SizedBox(
          height: 100,
        ),
        loginText(),
        const SizedBox(
          height: 10,
        ),
        Form(
          key: _loginController.formkey.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.transparent,
                  width: 350,
                  child: TextFormField(
                    key: const Key('user_name'),
                    validator: EmailFieldValidator.validate,
                    controller: _loginController.userName.value,
                    decoration: userNameInputDecoration(),
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
                  child: TextFormField(
                    key: const Key('password'),
                    validator: PasswordFieldValidator.validate,
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
                  width: 350,  //600
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      forgotPasswordButton(),
                      const SizedBox(
                        width: 10,
                      ),
                      loginButton(70),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
