import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AlertTypeIcon extends StatelessWidget {
  final PhosphorIconData icon;
  final Color color;
  const AlertTypeIcon({required this.icon, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color.withValues(alpha: 0.3)),
      padding: const EdgeInsets.all(8),
      child: PhosphorIcon(icon, color: color),
    );
  }
}
