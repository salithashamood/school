import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:school/binding.dart';
import 'package:school/components/mobile_login_page.dart';
import 'package:school/controllers/login_controller.dart';
import 'package:school/main.dart';
import 'package:school/screens/login_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  late LoginController loginController;
  setUp(
    () {
      loginController = LoginController();
    },
  );
  testWidgets('Empty user name field and password field',
      (WidgetTester tester) async {
    Get.put<LoginController>(LoginController());
    await tester.pumpWidget(Sizer(
      builder: (context, orientation, deviceType) => const MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: MobileLoginPage())),
      ),
    ));
    final tapButton = find.byKey(const Key('login'));
    final userNameError = find.text('Email can\'t be empty');
    final passwordError = find.text('Password can\'t be empty');
    await tester.ensureVisible(tapButton);
    // await tester.pumpAndSettle();
    await tester.tap(tapButton);
    await tester.pump();
    expect(userNameError, findsOneWidget);
    expect(passwordError, findsOneWidget);
  });
}
