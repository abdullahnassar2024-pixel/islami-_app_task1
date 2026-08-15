import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_task1/ui/home/tabs/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(height: height * 0.66, enlargeCenterPage: true),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadithItem(index: index);
      }).toList(),
    );
  }
}
