import 'package:eco/constants/utils.dart';
import 'package:eco/content/authentication/screens/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminService {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
          context, AuthenticationScreen.routeName, (route) => false);
    } catch (e) {
      showCustomDialog(context, e.toString(), false);
    }
  }
}
