import 'package:islami_app_task1/utils/app_assets.dart';
import 'package:islami_app_task1/utils/app_strings.dart';

class OnboardingData {
  String imagePath;
  String title;
  String? description;

  OnboardingData({
    required this.title,
    required this.imagePath,
    this.description,
  });

  static List<OnboardingData> OnboardingList = [
    OnboardingData(
      title: AppStrings.onBoarding1Title,
      imagePath: AppAssets.onBoarding1Image,
    ),
    OnboardingData(
      title: AppStrings.onBoarding2Title,
      imagePath: AppAssets.onBoarding2Image,
      description: AppStrings.onBoarding2Description,
    ),
    OnboardingData(
      title: AppStrings.onBoarding3Title,
      imagePath: AppAssets.onBoarding3Image,
      description: AppStrings.onBoarding3Description,
    ),
    OnboardingData(
      title: AppStrings.onBoarding4Title,
      imagePath: AppAssets.onBoarding4Image,
      description: AppStrings.onBoarding4Description,
    ),
    OnboardingData(
      title: AppStrings.onBoarding5Title,
      imagePath: AppAssets.onBoarding5Image,
      description: AppStrings.onBoarding5Description,
    ),
  ];
}
