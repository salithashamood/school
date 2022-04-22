import 'package:flutter/material.dart';

import '../components/mobile_login_page.dart';
import '../components/tablet_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 500) {
                return const TabletLoginPage();
              } else {
                return const MobileLoginPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
