import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:school/binding.dart';
import 'package:school/screens/camera_view_screen.dart';
import 'package:school/screens/home_page.dart';
import 'package:school/screens/main_home_screen.dart';
import 'package:school/screens/view_card_screen.dart';
import 'package:school/utils/user_secure_storage.dart';
import 'package:sizer/sizer.dart';

import 'screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

bool isTablet = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        isTablet = SizerUtil.deviceType == DeviceType.tablet;
        return GetMaterialApp(
          initialBinding: Binding(),
          debugShowCheckedModeBanner: false,
          title: 'School Login page',
          theme: ThemeData(
            fontFamily: 'segoeui',
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
          // home: const SetScreen(),
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
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setState(() {
      isLoading = true;
    });
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
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : isLogin
            ? MainHomeScreen()
            : LoginPage();
  }
}
