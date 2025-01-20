
import 'package:shared_preferences/shared_preferences.dart';

class Account {
  static const _keyUsername = 'username';
  static const _keyPassword = 'password';

  static Future<void> saveUserCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
    await prefs.setString(_keyPassword, password);
  }

  static Future<Map<String, String>> getUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString(_keyUsername);
    String? password = prefs.getString(_keyPassword);
    
    return {
      'username': username ?? '',
      'password': password ?? ''
    };
  }

}
