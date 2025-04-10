import 'package:chat_app/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';

class MyLoadingView extends StatelessWidget {
  final Color? color;
  const MyLoadingView({this.color = MyColors.primaryColor, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: color, strokeWidth: 1));
  }
}
