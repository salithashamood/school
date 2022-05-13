import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:school/components/mobile_login_page.dart';
import 'package:school/controllers/login_controller.dart';
import 'package:sizer/sizer.dart';

void main() {
  

  group('Login Screen', () {
    late LoginController loginController;
  setUp(
    () {
      loginController = LoginController();
      Get.put<LoginController>(LoginController());
      HttpOverrides.global = null;
    },
  );

  Widget testtedWidget(Widget widget) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          home: Scaffold(body: SingleChildScrollView(child: widget)),
        ),
      ),
    );
  }
      final tapButton = find.byKey(const Key('login'));
      final userNameFeild = find.byKey(const Key('user_name'));
      final passwordFeild = find.byKey(const Key('password'));
      final userNameError = find.text('Email can\'t be empty');
      final passwordError = find.text('Password can\'t be empty');
    testWidgets('Empty user name field and password field',
        (WidgetTester tester) async {
      await tester.pumpWidget(testtedWidget(const MobileLoginPage()));
      // await tester.pumpWidget(testtedWidget(TabletLoginPage()));  //width: 600

      await tester.ensureVisible(tapButton);
      // await tester.pumpAndSettle();
      await tester.tap(tapButton);

      await tester.pump();

      expect(userNameError, findsOneWidget);
      expect(passwordError, findsOneWidget);
    });

    testWidgets('Non-Empty user name field and password field',
        (WidgetTester tester) async {
      await tester.pumpWidget(testtedWidget(const MobileLoginPage()));
      // await tester.pumpWidget(testtedWidget(TabletLoginPage()));  //width: 600

      await tester.enterText(userNameFeild, 'superadmin@assethub.com.au');
      await tester.enterText(passwordFeild, 'password');

      await tester.ensureVisible(tapButton);

      await tester.tap(tapButton);

      await tester.pump();

      expect(userNameError, findsNothing);
      expect(passwordError, findsNothing);
    });

    // testWidgets('Correct user name field and password field',
    //     (WidgetTester tester) async {
      // await tester.pumpWidget(testtedWidget(MobileLoginPage()));
      // final tapButton = find.byKey(const Key('login'));
      // final userNameFeild = find.byKey(const Key('user_name'));
      // final passwordFeild = find.byKey(const Key('password'));
      // final userNameError = find.text('Email can\'t be empty');
      // final passwordError = find.text('Password can\'t be empty');
      // await tester.enterText(userNameFeild, 'superadmin@assethub.com.au');
      // await tester.enterText(passwordFeild, 'qazwsx1-2/');
      // loginController.userName.value.text = "superadmin@assethub.com.au";
      // loginController.password.value.text = "qazwsx1-2/";
      // await tester.ensureVisible(tapButton);
      // // await tester.pumpAndSettle();
      // await tester.tap(tapButton);
      // await tester.pump();
      // expect(userNameError, findsNothing);
      // expect(passwordError, findsNothing);
      // print(loginController.userName.value.text);
    // });
  });
}
