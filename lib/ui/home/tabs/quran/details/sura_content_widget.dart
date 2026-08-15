import 'package:flutter/material.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class SuraContentWidget extends StatelessWidget {
  final String content;

  const SuraContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Text(
      content,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: AppStyle.bold20Primary,
    );
  }
}
