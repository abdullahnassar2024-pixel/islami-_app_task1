import 'package:flutter/material.dart';
import 'package:islami_app_task1/ui/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_app_task1/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app_task1/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app_task1/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app_task1/ui/home/tabs/time/time_tab.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  // Map<int,String> imagesList = {
  //   0:AppAssets.quranBg,
  //   1:AppAssets.hadithBg,
  //   2:AppAssets.sebhaBg,
  //   3:AppAssets.radioBg,
  //   4:AppAssets.timeBg,
  // };

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          //imagesList[selectedIndex]!,
          //getBackgroundImages(),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            backgroundColor: AppColors.transparentColor,
            bottomNavigationBar: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(

                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  buildBottomNavigationBarItem(
                    icon: AppAssets.iconQuran,
                    label: 'Quran',
                    index: 0,
                    currentIndex: selectedIndex,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.iconHadith,
                    label: 'Hadith',
                    index: 1,
                    currentIndex: selectedIndex,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.iconSebha,
                    label: 'Sebha',
                    index: 2,
                    currentIndex: selectedIndex,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.iconRadio,
                    label: 'Radio',
                    index: 3,
                    currentIndex: selectedIndex,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.iconTime,
                    label: 'Time',
                    index: 4,
                    currentIndex: selectedIndex,
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Column(
                spacing: size.height * 0.01,
                children: [
                  Image.asset(AppAssets.logo),
                  Expanded(child: tabsList[selectedIndex]),
                ],
              ),
            )
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
    required int currentIndex,
  }) {
    return BottomNavigationBarItem(
      icon: currentIndex == index
          ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.blackBgColor,
          borderRadius: BorderRadius.circular(66),
        ),
        child: ImageIcon(AssetImage(icon)),
      )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }

  String getBackgroundImages() {
    switch (selectedIndex) {
      case 0:
        return AppAssets.quranBg;
      case 1:
        return AppAssets.hadithBg;
      case 2:
        return AppAssets.sebhaBg;
      case 3:
        return AppAssets.radioBg;
      case 4:
        return AppAssets.timeBg;

      default:
        return AppAssets.quranBg;
    }
  }
}
