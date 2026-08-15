import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_task1/model/hadith.dart';
import 'package:islami_app_task1/model/hadith_details_args.dart';
import 'package:islami_app_task1/ui/home/tabs/hadith/hadith_text_widget.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_routes.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class HadithItem extends StatefulWidget {
  final int index;

  HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadith? hadith;

  @override
  void initState() {
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.hadithDetailsRouteName,
          arguments: HadithDetailsArgs(hadith: hadith, index: widget.index),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(image: AssetImage(AppAssets.hadithItemBack)),
          color: AppColors.primaryColor,
        ),

        margin: EdgeInsets.only(bottom: height * 0.01),
        child: hadith == null
            ? Center(
                child: CircularProgressIndicator(color: AppColors.blackBgColor),
              )
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppAssets.leftCornerImgBlack,
                          width: width * 0.16,
                        ),
                        Expanded(
                          child: HadithTextWidget(
                            text: hadith?.title ?? '',
                            textStyle: AppStyle.bold24Black,
                          ),
                        ),
                        Image.asset(
                          AppAssets.rightCornerImgBlack,
                          width: width * 0.16,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: HadithTextWidget(
                        text: hadith?.content ?? '',
                        textStyle: AppStyle.bold16Black,
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.bottomDecorationImgBlack),
                ],
              ),
      ),
    );
  }

  void loadHadithFile() async {
    String hadithContent = await rootBundle.loadString(
      'assets/files/hadith/h${widget.index}.txt',
    );
    int hadithFileIndex = hadithContent.indexOf('\n');
    String title = hadithContent.substring(0, hadithFileIndex);
    String content = hadithContent.substring(hadithFileIndex + 1);
    hadith = Hadith(title: title, content: content);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
