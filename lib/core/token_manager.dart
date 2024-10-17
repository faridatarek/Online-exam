import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> setToken(String token, String email) async {
    await _secureStorage.write(key: 'token', value: token);
  }

  static Future<String?> getToken({required String key}) async {
    return await _secureStorage.read(key: 'token');
  }

  static Future<void> deleteToken({required String key}) async {
    await _secureStorage.delete(key: 'token');
  }
}
