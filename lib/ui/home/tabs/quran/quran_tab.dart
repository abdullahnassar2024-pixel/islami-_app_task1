import 'package:flutter/material.dart';
import 'package:islami_app_task1/cache/shared_prefs_utils.dart';
import 'package:islami_app_task1/model/quran_resources.dart';
import 'package:islami_app_task1/ui/home/tabs/quran/most_recent_widget.dart';
import 'package:islami_app_task1/ui/home/tabs/quran/sura_widget.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_routes.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: SingleChildScrollView(
        child: Column(
          spacing: size.height * 0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              cursorColor: AppColors.primaryColor,
              style: AppStyle.bold16White,
              onChanged: (text) {
                searchBySuraName(text);
              },
              decoration: InputDecoration(
                enabledBorder: buildTextFieldDecoration(),
                focusedBorder: buildTextFieldDecoration(),
                prefixIcon: Image.asset(AppAssets.iconSearch),
                hintText: 'Sura Name',
                hintStyle: AppStyle.bold16White,
              ),
            ),
            MostRecentWidget(),
            Text('Suras List', style: AppStyle.bold16White),
            filterList.isEmpty
                ? Center(
                    child: Text(
                      'No Sura Name Found',
                      style: AppStyle.bold20Primary,
                    ),
                  )
                : ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // todo last sura index
                          saveLastSuraIndex(filterList[index]);
                          // todo navigate  to sura details screen
                          Navigator.of(context).pushNamed(
                            AppRoutes.suraDetails1RouteName,
                            arguments: filterList[index],
                          );
                        },
                        child: SuraWidget(index: filterList[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.whiteColor,
                        thickness: 2,
                        height: size.height * 0.03,
                        indent: size.width * 0.06,
                        endIndent: size.width * 0.06,
                      );
                    },
                    itemCount: filterList.length,
                  ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildTextFieldDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
    );
  }

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
        suraName.toLowerCase(),
      )) {
        searchList.add(i);
      }
      if (QuranResources.arabicQuranSuraList[i].contains(suraName)) {
        searchList.add(i);
      }
    }
    filterList = searchList;
    setState(() {});
  }
}
