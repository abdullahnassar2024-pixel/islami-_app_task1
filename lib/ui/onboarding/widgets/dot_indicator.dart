import 'package:flutter/material.dart';
import 'package:islami_app_task1/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({super.key, required this.isActive});

  bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 8),
      duration: Duration(milliseconds: 200),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.gray,
        borderRadius: BorderRadius.circular(27),
      ),
    );
  }
}
