import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_task1/model/quran_resources.dart';
import 'package:islami_app_task1/providers/most_recent_provider.dart';
import 'package:islami_app_task1/ui/home/tabs/quran/details/sura_content_widget.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_style.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String verses = '';
  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyle.bold20Primary,
        ),
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
                Text(
                  QuranResources.arabicQuranSuraList[index],
                  style: AppStyle.bold24Primary,
                ),
                Image.asset(AppAssets.rightCornerImg),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      child: SuraContentWidget(content: verses),
                    ),
            ),
          ),
          Image.asset(AppAssets.bottomDecorationImg),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getMostRecentList();
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    verses = lines.join(' ');
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
