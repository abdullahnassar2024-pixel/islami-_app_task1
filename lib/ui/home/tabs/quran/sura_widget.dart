import 'package:flutter/material.dart';
import 'package:islami_app_task1/model/quran_resources.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class SuraWidget extends StatelessWidget {
  final int index;

  const SuraWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Row(
      spacing: width * 0.04,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.group),
            Text('${index + 1}', style: AppStyle.bold16White),
          ],
        ),
        Expanded(
          child: Column(
            spacing: height * 0.01,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResources.englishQuranSuraList[index],
                style: AppStyle.bold20White,
              ),
              Text(
                '${QuranResources.ayaNumberList[index]} Vewses',
                style: AppStyle.bold14White,
              ),
            ],
          ),
        ),

        Text(
          QuranResources.arabicQuranSuraList[index],
          style: AppStyle.bold20White,
        ),
      ],
    );
  }
}
