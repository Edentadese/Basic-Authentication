import 'package:eco/common/widgets/button.dart';
import 'package:eco/content/admin/services/admin_service.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final AdminService adminService = AdminService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Admin"), CButton(text: "Log out", onTap: () => AdminService().logOut(context))],
      )),
    );
  }
}
