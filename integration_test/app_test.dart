import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:school/components/mobile_login_page.dart';
import 'package:school/main.dart' as app;
import 'package:school/screens/login_page.dart';
import 'package:school/screens/main_home_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Test', () {
    final tapButton = find.byKey(const Key('login'));
    final userNameFeild = find.byKey(const Key('user_name'));
    final passwordFeild = find.byKey(const Key('password'));
    
    testWidgets('Login page to home screen', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byWidgetPredicate((widget) => widget is LoginPage),
          findsOneWidget);

      expect(find.byWidgetPredicate((widget) => widget is MobileLoginPage),
          findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 4));

      await tester.enterText(userNameFeild, 'superadmin@assethub.com.au');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.enterText(passwordFeild, 'qazwsx1-2/');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.ensureVisible(tapButton);
      await tester.tap(tapButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byWidgetPredicate((widget) => widget is MainHomeScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });

    testWidgets('Tap login button with wrong details', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byWidgetPredicate((widget) => widget is LoginPage),
          findsOneWidget);

      expect(find.byWidgetPredicate((widget) => widget is MobileLoginPage),
          findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 4));

      await tester.enterText(userNameFeild, 'superadmin@assethub.com.au');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.enterText(passwordFeild, 'qazwsx1-2/0');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.ensureVisible(tapButton);
      await tester.tap(tapButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byWidgetPredicate((widget) => widget is MainHomeScreen), findsNothing);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
