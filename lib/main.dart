import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:school/binding.dart';
import 'package:school/screens/home_page.dart';
import 'package:school/utils/user_secure_storage.dart';
import 'package:sizer/sizer.dart';

import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          initialBinding: Binding(),
          debugShowCheckedModeBanner: false,
          title: 'School Login page',
          theme: ThemeData(
            fontFamily: 'segoeui',
            primarySwatch: Colors.blue,
          ),
          home: const SetScreen(),
          // home: HomePage(),
        );
      },
    );
  }
}

class SetScreen extends StatefulWidget {
  const SetScreen({Key? key}) : super(key: key);

  @override
  State<SetScreen> createState() => _SetScreenState();
}

class _SetScreenState extends State<SetScreen> {
  bool isLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    final jwtToken = await UserSecureStorage.getJwtToken();
    if (jwtToken == null) {
      setState(() {
        isLogin = false;
      });
    } else {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? HomePage() : LoginPage();
  }
}
