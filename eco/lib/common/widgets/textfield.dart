import 'package:flutter/material.dart';

class TField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Color iconColor; // New parameter for icon color

  const TField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.iconColor = Colors.black, // Default icon color is black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: iconColor), // Specify the icon color
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
      ),
    );
  }
}