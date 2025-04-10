import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MyAvatarPlaceholder extends StatelessWidget {
  final double size;
  final Color color;
  const MyAvatarPlaceholder({required this.size, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhosphorIcon(
        PhosphorIconsRegular.user,
        size: size / 2,
        color: color,
      ),
    );
  }
}
