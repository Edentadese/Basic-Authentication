import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, String text, bool isSuccess) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        content: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(20.0),
      );
    },
  );
}
