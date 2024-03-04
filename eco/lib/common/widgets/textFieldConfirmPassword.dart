import 'package:flutter/material.dart';

class TFieldCPassword extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String hintText;
  final Color iconColor; // New parameter for icon color

  const TFieldCPassword({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.hintText,
    this.iconColor = Colors.black, // Default icon color is black
  }) : super(key: key);

  @override
  _TFieldCPasswordState createState() => _TFieldCPasswordState();
}

class _TFieldCPasswordState extends State<TFieldCPassword> {
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: widget.passwordController,
            obscureText: _obscureTextPassword,
            decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
              ),
              prefixIcon: Icon(Icons.lock, color: widget.iconColor), // Specify the icon color
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                  color: widget.iconColor, // Specify the icon color
                ),
                onPressed: () {
                  setState(() {
                    _obscureTextPassword = !_obscureTextPassword;
                  });
                },
              ),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter your ${widget.hintText}';
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
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: widget.confirmPasswordController,
            obscureText: _obscureTextConfirmPassword,
            decoration: InputDecoration(
              hintText: 'Confirm ${widget.hintText}',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
              ),
              prefixIcon: Icon(Icons.lock, color: widget.iconColor), // Specify the icon color
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureTextConfirmPassword ? Icons.visibility : Icons.visibility_off,
                  color: widget.iconColor, // Specify the icon color
                ),
                onPressed: () {
                  setState(() {
                    _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
                  });
                },
              ),
            ),
            validator: (val) {
              if (val != widget.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}