import 'package:flutter/material.dart';
import 'package:islami_app_task1/model/quran_resources.dart';
import 'package:islami_app_task1/providers/most_recent_provider.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_routes.dart';
import 'package:islami_app_task1/utils/app_style.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();

    mostRecentProvider = Provider.of<MostRecentProvider>(
      context,
      listen: false,
    );

    mostRecentProvider.getMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<MostRecentProvider>(
      builder: (context, provider, child) {
        return Visibility(
          visible: provider.mostRecentList.isNotEmpty,
          child: Column(
            spacing: size.height * 0.01,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Most Recently', style: AppStyle.bold16White),

              SizedBox(
                height: size.height * 0.2,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // todo navigate to sura details screen
                        Navigator.of(context).pushNamed(
                          AppRoutes.suraDetails1RouteName,
                          arguments: mostRecentProvider.mostRecentList[index],
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primaryColor,
                        ),

                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Text(
                                  QuranResources.englishQuranSuraList[provider
                                      .mostRecentList[index]],
                                  style: AppStyle.bold24Black,
                                ),

                                Text(
                                  QuranResources.arabicQuranSuraList[provider
                                      .mostRecentList[index]],
                                  style: AppStyle.bold24Black,
                                ),

                                Text(
                                  '${QuranResources.ayaNumberList[provider.mostRecentList[index]]} Verses',
                                  style: AppStyle.bold14Black,
                                ),
                              ],
                            ),

                            Image.asset(AppAssets.mostRecent),
                          ],
                        ),
                      ),
                    );
                  },

                  separatorBuilder: (context, index) {
                    return SizedBox(width: size.width * 0.04);
                  },

                  itemCount: provider.mostRecentList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
