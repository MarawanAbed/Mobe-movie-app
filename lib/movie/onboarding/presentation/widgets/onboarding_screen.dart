import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/movie/onboarding/domain/entities/on_boarding_entity.dart';
import 'package:movie_app/movie/onboarding/presentation/widgets/on_boarding_items.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  double _currentPage = 0;

  final List<OnBoardingEntity> onBoarding = [
    OnBoardingEntity(
      title: 'Welcome to Mobe',
      image: AppImages.onBoarding1,
      subTitle: 'The best place to discover new movies and tv series',
      colors: AppColors.kOnBoarding1Color,
    ),
    OnBoardingEntity(
      title: 'Discover Movies',
      image: AppImages.onBoarding2,
      subTitle: 'Find the best movies and tv series',
      colors: AppColors.kOnBoarding2Color,
    ),
    OnBoardingEntity(
      title: 'Watch Movies and Tv Series',
      image: AppImages.onBoarding3,
      subTitle: 'Watch movies and tv series anytime, anywhere',
      colors: AppColors.kOnBoarding3Color,
    ),
    OnBoardingEntity(
      title: 'Watch later',
      image: AppImages.onBoarding4,
      subTitle: 'Save movies and tv series to watch later',
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
