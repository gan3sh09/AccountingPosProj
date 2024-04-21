import 'package:accounting_pos_project/theme/colors.dart';
import 'package:flutter/material.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Text(
        message!,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: tassistPrimary,
    ),
  );
}
