import 'package:flutter/material.dart';
import 'package:islami_app_task1/model/onboarding_data.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key, required this.onboardingData});

  OnboardingData onboardingData;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Expanded(child: Image.asset(onboardingData.imagePath)),
        SizedBox(height: 24),
        Text(
          onboardingData.title,
          textAlign: TextAlign.center,
          style: AppStyle.bold24Primary,
        ),

        if (onboardingData.description != null)
          Text(
            onboardingData.description!,
            textAlign: TextAlign.center,
            style: AppStyle.bold24Primary,
          ),

        SizedBox(height: 24),
      ],
    );
  }
}
