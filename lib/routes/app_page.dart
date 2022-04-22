import 'package:get/get.dart';

import '../binding.dart';
import '../screens/login_page.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginPage(),
        binding: Binding(),),
  ];
}
