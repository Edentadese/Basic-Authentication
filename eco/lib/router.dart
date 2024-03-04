import 'package:eco/content/authentication/screens/authentication_screen.dart';
import 'package:eco/content/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthenticationScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("Error"),),));

  }
}
