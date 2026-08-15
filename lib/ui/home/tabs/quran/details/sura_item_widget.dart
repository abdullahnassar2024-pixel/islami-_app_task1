import 'package:flutter/material.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class SuraItemWidget extends StatelessWidget {
  final String content;
  final int index;

  const SuraItemWidget({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Text(
        '$content ${[index + 1]} ',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: AppStyle.bold20Primary,
      ),
    );
  }
}
