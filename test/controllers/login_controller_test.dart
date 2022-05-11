import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:school/components/mobile_login_page.dart';
import 'package:school/controllers/login_controller.dart';
import 'package:school/models/user_model.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late LoginController loginController;
  setUp(
    () {
     loginController = LoginController();
    },
  );
  group(
    'Login Controller',
    () {
      test('Login Screen with correct username and password', () async {
        Get.put(loginController);
        loginController.userName.value.text = "superadmin@assethub.com.au";
        loginController.password.value.text = "qazwsx1-2/";
        final client = MockClient();
        var loginData = {
          'Username': loginController.userName.value.text,
          'Password': loginController.password.value.text
          // 'Username': "superadmin@assethub.com.au",
          // 'Password': "qazwsx1-2/"
        };
        when(client.post(
          Uri.parse('https://dev.api.cams.assethub.com.au/api/Users/signin'),
          body: jsonEncode(loginData),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
        )).thenAnswer((_) async {
          return http.Response(
              '{"jwtToken" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVkYzhjMDc4MmRkOTI1YmIxZDRlNGY3MCIsInVzZXJuYW1lIjoic3VwZXJhZG1pbkBhc3NldGh1Yi5jb20uYXUiLCJmaXJzdE5hbWUiOiJTdXBlciIsImxhc3ROYW1lIjoiQWRtaW4gIiwib3JnYW5pc2F0aW9uSWRzIjoiIiwiY29udHJhY3RvcklkIjoiMCIsImlzU3VwZXJBZG1pbiI6IlRydWUiLCJpc0NBTVNBZG1pbiI6IlRydWUiLCJpc09yZ2FuaXNhdGlvbkFkbWluIjoiVHJ1ZSIsImlzT3JnYW5pc2F0aW9uVXNlciI6IlRydWUiLCJpc0NvbnRyYWN0b3JBZG1pbiI6IlRydWUiLCJpc0NvbnRyYWN0b3JVc2VyIjoiVHJ1ZSIsIm5iZiI6MTY1MjE3ODM4OSwiZXhwIjoxNjUyMTc4NDQ5LCJpYXQiOjE2NTIxNzgzODksImlzcyI6Imh0dHA6Ly93d3cuY2Ftcy5hc3NldGh1Yi5jb20uYXUiLCJhdWQiOiJodHRwOi8vd3d3LmNhbXMuYXNzZXRodWIuY29tLmF1LyJ9.Z8itO-e9WbRYiTQXGYlCBgFgpGN43O3wiH5wNH4uWGg", "refreshToken" : "994ca1c176cc473199d082db26056c58"}',
              200);
        });
        expect(await loginController.logIn(isTest: true, client: client),
            isA<UserModel>());
      });

      test('Login Screen with invalid username and password', () async {
        Get.put(loginController);
        loginController.userName.value.text = "superadmin@assethub.com.au";
        loginController.password.value.text = "qazwsx1-2/00";
        final client = MockClient();
        var loginData = {
          'Username': loginController.userName.value.text,
          'Password': loginController.password.value.text
          // 'Username': "superadmin@assethub.com.au",
          // 'Password': "qazwsx1-2/"
        };
        when(client.post(
          Uri.parse('https://dev.api.cams.assethub.com.au/api/Users/signin'),
          body: jsonEncode(loginData),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
        )).thenAnswer((_) async {
          return http.Response(
              '{"message" : "CU004: Password is Incorrect"}', 400);
        });
        expect(loginController.logIn(isTest: true, client: client),
            throwsException);
      });

      test('Email field empty', () async {
        var result = EmailFieldValidator.validate('');
        expect(result, 'Email can\'t be empty');
      });

      test('Email field not empty', () async {
        var result = EmailFieldValidator.validate('email');
        expect(result, null);
      });

      test('Password field empty', () async {
        var result = PasswordFieldValidator.validate('');
        expect(result, 'Password can\'t be empty');
      });

      test('Password field not empty', () async {
        var result = PasswordFieldValidator.validate('password');
        expect(result, null);
      });
    },
  );
}
