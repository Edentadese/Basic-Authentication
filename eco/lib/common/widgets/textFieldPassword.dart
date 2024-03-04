import 'package:flutter/material.dart';

class TFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const TFieldPassword({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }

        if (val.length < 6) {
          return 'Password must be at least 6 characters long';
        }

        if (val[0] != val[0].toUpperCase()) {
          return 'First letter of the password must be uppercase';
        }

        if (!val.contains(RegExp(r'[A-Za-z]'))) {
          return 'Password must contain at least one character';
        }

        return null;
      },
    );
  }
}