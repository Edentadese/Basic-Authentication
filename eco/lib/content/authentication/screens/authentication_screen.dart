import 'dart:async';

import 'package:eco/common/widgets/button.dart';
import 'package:eco/common/widgets/textFieldConfirmPassword.dart';
// import 'package:eco/common/widgets/textFieldPassword.dart';
import 'package:eco/constants/global.dart';
import 'package:eco/content/authentication/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:eco/common/widgets/textfield.dart';

enum Authentication { signin, signup }

class AuthenticationScreen extends StatefulWidget {
  static const String routeName = '/authentication-screen';

  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  Authentication _authentication = Authentication.signup;
  final _singUpFormKey = GlobalKey<FormState>();
  final _singInFormKey = GlobalKey<FormState>();
  final AuthenticationService authenticationService = AuthenticationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void signUpUser() {
    authenticationService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authenticationService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.pink, Colors.red],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const Text(
                        "back!",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _authentication = Authentication.signup;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: _authentication == Authentication.signup
                                  ? Global.backgroundColor
                                  : Global.greyBackgroundCOlor,
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _authentication = Authentication.signin;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: _authentication == Authentication.signin
                                  ? Global.backgroundColor
                                  : Global.greyBackgroundCOlor,
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              if (_authentication == Authentication.signup)
                                Form(
                                  key: _singUpFormKey,
                                  child: Column(
                                    children: [
                                      TField(
                                        controller: _emailController,
                                        hintText: "Email",
                                        icon: Icons.email,
                                        iconColor: Colors.purple,
                                      ),
                                      const SizedBox(height: 10),
                                      TField(
                                        controller: _nameController,
                                        hintText: "Name",
                                        icon: Icons.person,
                                        iconColor: Colors.purple,
                                      ),
                                      const SizedBox(height: 10),
                                      TFieldCPassword(
                                        iconColor: Colors.purple,
                                        passwordController: _passwordController,
                                        confirmPasswordController:
                                            _confirmPasswordController,
                                        hintText: "password",
                                      ),
                                      const SizedBox(height: 10),
                                      CButton(
                                        text: "Sign Up",
                                        onTap: () {
                                          if (_singUpFormKey.currentState!
                                              .validate()) {
                                            signUpUser();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (_authentication == Authentication.signin)
                                Form(
                                  key: _singInFormKey,
                                  child: Column(
                                    children: [
                                      TField(
                                        iconColor: Colors.purple,
                                        controller: _emailController,
                                        hintText: "Email",
                                        icon: Icons.email,
                                      ),
                                      const SizedBox(height: 10),
                                      TField(
                                        iconColor: Colors.purple,
                                        controller: _passwordController,
                                        hintText: "Password",
                                        icon: Icons.password,
                                      ),
                                      const SizedBox(height: 10),
                                      CButton(
                                        text: "Sign In",
                                        onTap: () {
                                          if (_singInFormKey.currentState!
                                              .validate()) {
                                            signInUser();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
