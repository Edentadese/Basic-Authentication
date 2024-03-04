import 'package:flutter/material.dart';

String uri = 'http://192.168.56.1:3000';

class Global {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 46, 7, 60),
      Color.fromARGB(255, 46, 7, 60),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(127, 27, 147, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Color.fromARGB(255, 46, 7, 60)!;
  static const unselectedNavBarColor = Colors.black87;
}
