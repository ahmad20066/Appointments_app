import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  final bool isError;
  final String text;

  CustomSnackbar({super.key, required this.isError, required this.text})
      : super(
            content: Text(text),
            backgroundColor: isError ? Colors.red : Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3));
}
