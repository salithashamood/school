import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:school/binding.dart';

import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'School Login page',
      theme: ThemeData(
        fontFamily: 'segoeui',
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      // home: HomePage(),
    );
  }
}
