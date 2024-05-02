// PACKAGE
import 'package:flutter/material.dart';

class FailureResponsesWidget extends StatelessWidget {
  final String errorMessage;

  const FailureResponsesWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      content: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}