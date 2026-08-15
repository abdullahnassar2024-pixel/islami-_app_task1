import 'package:flutter/material.dart';
import 'package:islami_app_task1/model/hadith_details_args.dart';
import 'package:islami_app_task1/ui/home/tabs/hadith/hadith_text_widget.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class HadithDetailsScreen extends StatefulWidget {
  const HadithDetailsScreen({super.key});

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var args = ModalRoute.of(context)?.settings.arguments as HadithDetailsArgs;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text('Hadith ${args.index}', style: AppStyle.bold20Primary),
      ),
      body: Column(
        spacing: height * 0.02,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftCornerImg),
                Expanded(
                  child: HadithTextWidget(
                    text: args.hadith?.title ?? '',
                    textStyle: AppStyle.bold24Primary,
                  ),
                ),

                Image.asset(AppAssets.rightCornerImg),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: SingleChildScrollView(
                child: HadithTextWidget(
                  text: args.hadith?.content ?? '',
                  textStyle: AppStyle.bold20Primary,
                ),
              ),
            ),
          ),
          Image.asset(AppAssets.bottomDecorationImg),
        ],
      ),
    );
  }
}
