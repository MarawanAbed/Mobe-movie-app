import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/onboarding/domain/entities/on_boarding_entity.dart';
import 'package:movie_app/movie/onboarding/presentation/widgets/on_boarding_items.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  double _currentPage = 0;

  final List<OnBoardingEntity> onBoarding = [
    OnBoardingEntity(
      title: AppStrings.onboarding1title,
      image: AppImages.onBoarding1,
      subTitle: AppStrings.onboarding1subTitle,
      colors: AppColors.kOnBoarding1Color,
    ),
    OnBoardingEntity(
      title: AppStrings.onboarding2title,
      image: AppImages.onBoarding2,
      subTitle: AppStrings.onboarding2subTitle,
      colors: AppColors.kOnBoarding2Color,
    ),
    OnBoardingEntity(
      title: AppStrings.onboarding3title,
      image: AppImages.onBoarding3,
      subTitle: AppStrings.onboarding3subTitle,
      colors: AppColors.kOnBoarding3Color,
    ),
    OnBoardingEntity(
      title: AppStrings.onboarding4title,
      image: AppImages.onBoarding4,
      subTitle: AppStrings.onboarding4subTitle,
      colors: AppColors.kOnBoarding4Color,
    ),
  ];

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: onBoarding.length,
      itemBuilder: (context, index) {
        return OnBoardingItems(
          image: onBoarding[index].image,
          length: onBoarding.length,
          title: onBoarding[index].title,
          subTitle: onBoarding[index].subTitle,
          controller: _controller,
          currentPage: _currentPage,
          colors: onBoarding[index].colors,
        );
      },
    );
  }
}
