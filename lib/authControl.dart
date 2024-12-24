import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthControl {
  static const userKey = 'user';
  static var currentUser;

  dataInit() async {
    final prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString(userKey);
    if (user != null) {
      currentUser = json.decode(user);
    }
  }

  Future<String> register(String login, String password) async {
    final prefs = await SharedPreferences.getInstance();
    var newUser = {
      'login': login,
      'password': password,
    };
    prefs.setString(userKey, json.encode(newUser));
    return 'User registered successfully';
  }

  Future<String> login(String login, String password) async {
    final prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString(userKey);
    if (user != null) {
      var storedUser = json.decode(user);
      if (storedUser['login'] == login && storedUser['password'] == password) {
        currentUser = storedUser;
        return 'Login successful';
      }
    }
    return 'Invalid login or password';
  }

  Future<void> logout() async {
    currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userKey);
  }
}
