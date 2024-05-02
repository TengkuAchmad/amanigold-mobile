// PACKAGES
import 'package:flutter/material.dart';

class SuccessResponseWidget extends StatelessWidget{
  final String successMessage;

  const SuccessResponseWidget({super.key, required this.successMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: Text(
        successMessage,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}