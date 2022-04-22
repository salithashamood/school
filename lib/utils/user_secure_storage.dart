import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _jwtToken = 'jwtToken';
  static const _refreshToken = 'refreshToken';

  static Future setJwtToken(String jwtToken) async =>
      await _storage.write(key: _jwtToken, value: jwtToken);

  static Future<String?> getJwtToken() async =>
      await _storage.read(key: _jwtToken);

  static Future setRefreshToken(String refreshToken) async =>
      await _storage.write(key: _refreshToken, value: refreshToken);

  static Future<String?> getRefreshToken() async =>
      await _storage.read(key: _refreshToken);

  static Future deleteAll() async => await _storage.deleteAll();
}
