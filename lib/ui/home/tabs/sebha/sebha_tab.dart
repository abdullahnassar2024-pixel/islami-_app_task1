import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_strings.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 0.0;
  List<String> zekrList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];
  late String zekrTitle = zekrList[0];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(AppStrings.zekrHeader, style: AppStyle.bold36White),
          SizedBox(height: 8),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Row(),
                Image.asset(AppAssets.sebhaHead, height: size.height * 0.1),
                Positioned.fill(
                  top: size.height * 0.09,
                  child: Stack(
                    children: [
                      AnimatedRotation(
                        turns: turns,
                        duration: Duration(milliseconds: 200),
                        child: InkWell(
                          onTap: () {
                            _updataZekr();
                          },
                          child: Image.asset(
                            AppAssets.sebhaBody,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Row(),
                          Text(zekrTitle, style: AppStyle.bold36White),
                          SizedBox(height: 16),
                          Text(counter.toString(), style: AppStyle.bold36White),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int zekrIndex = 0;

  void _updataZekr() {
    setState(() {
      counter++;
      turns = turns + (pi / 66);
      if (counter == 33) {
        zekrIndex = (zekrIndex + 1) % zekrList.length;
        zekrTitle = zekrList[zekrIndex];
        counter = 0;
      }
    });
  }
}
