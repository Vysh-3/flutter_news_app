import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false) {
    _checkLogin();
  }

  void _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('loggedIn') ?? false;
  }

  void login(String email, String pass) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', true);
    state = true;
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedIn');
    state = false;
  }
}
