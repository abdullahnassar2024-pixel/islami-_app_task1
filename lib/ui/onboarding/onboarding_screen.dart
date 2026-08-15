import 'package:flutter/material.dart';
import 'package:islami_app_task1/model/onboarding_data.dart';
import 'package:islami_app_task1/ui/onboarding/widgets/onboarding_page.dart';
import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_routes.dart';
import 'package:islami_app_task1/utils/app_strings.dart' as Strings;
import 'package:islami_app_task1/utils/app_strings.dart';
import 'package:islami_app_task1/utils/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiHeader, height: size.height * 0.25),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: OnboardingData.OnboardingList.length,
              itemBuilder: (context, index) => OnboardingPage(
                onboardingData: OnboardingData.OnboardingList[index],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentIndex == 0
                          ? null
                          : () {
                              pageController.animateToPage(
                                currentIndex - 1,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            },
                      style: TextButton.styleFrom(
                        textStyle: AppStyle.bold16Primary,
                        foregroundColor: AppColors.primaryColor,
                      ),
                      child: currentIndex == 0
                          ? SizedBox.shrink()
                          : Text(AppStrings.back),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == 4) {
                          _seenOnboarding();
                        } else {
                          pageController.animateToPage(
                            currentIndex + 1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        }
                        pageController.animateToPage(
                          currentIndex + 1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: TextButton.styleFrom(
                        textStyle: AppStyle.bold16Primary,
                        foregroundColor: AppColors.primaryColor,
                      ),
                      child: Text(
                        currentIndex == 4
                            ? Strings.AppStrings.finish
                            : AppStrings.next,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnboardingData.OnboardingList.length,
                  (index) => DotIndicator(isActive: index == currentIndex),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _seenOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
    Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
  }
}
