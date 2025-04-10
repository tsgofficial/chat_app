import 'package:flutter/material.dart';

import '../theme/colors/my_colors.dart';

class HandleBar extends StatelessWidget {
  const HandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 6,
      decoration: BoxDecoration(
        color: MyColors.handleBarColor,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
