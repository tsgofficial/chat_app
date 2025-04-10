import 'package:flutter/material.dart';

class PasswordRule extends StatelessWidget {
  final bool passed;
  final String label;
  const PasswordRule({required this.passed, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          passed ? Icons.check_circle : Icons.cancel,
          color: passed ? Colors.green : Colors.red,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: passed ? Colors.green : Colors.red,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
