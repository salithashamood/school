part of 'app_page.dart';

abstract class Routes {
  static var Home;

  Routes._();

  static const HOME = _Paths.LOGIN;
}

abstract class _Paths {
  static const LOGIN = '/login';
}
