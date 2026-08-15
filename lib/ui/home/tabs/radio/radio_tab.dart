import 'package:flutter/material.dart';
import 'package:islami_app_task1/ui/home/tabs/radio/radio_item.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.blackBgColor,
              ),
              child: TabBar(
                labelColor: AppColors.blackColor,
                unselectedLabelColor: AppColors.whiteColor,
                labelStyle: AppStyle.bold16White,
                unselectedLabelStyle: AppStyle.bold16White,
                indicatorColor: AppColors.transparentColor,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor,
                ),
                tabs: const [
                  Tab(text: 'Radio'),
                  Tab(text: 'Reciters'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      RadioItem(),
                      RadioItem(),
                      RadioItem(),
                      RadioItem(),
                      RadioItem(),
                    ],
                  ),
                  ListView(
                    children: [
                      RadioItem(),
                      RadioItem(),
                      RadioItem(),
                      RadioItem(),
                      RadioItem(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
