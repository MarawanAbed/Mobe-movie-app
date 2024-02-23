import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/di/dependancy_injection.dart';
import 'package:movie_app/core/helpers/cache.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/core/utils/strings.dart';

class OnBoardingItems extends StatelessWidget {
  const OnBoardingItems({
    super.key,
    required this.image,
    required this.currentPage,
    required this.controller,
    required this.colors,
    required this.title,
    required this.subTitle,
    required this.length,
  });

  final String image;
  final String title;
  final String subTitle;
  final double currentPage;
  final PageController controller;
  final Color colors;

  final int length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundImage(),
        buildGradientOverlay(),
        buildCenteredText(),
        buildDotsIndicator(),
        buildNextButton(context),
        buildSkipButton(),
      ],
    );
  }

  Image buildBackgroundImage() {
    return Image.asset(image);
  }

  Container buildGradientOverlay() {
    return Container(
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors,
            colors.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.38, 0.9],
        ),
      ),
    );
  }

  Center buildCenteredText() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            HelperMethod.verticalSpace(20),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildDotsIndicator() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DotsIndicator(
            dotsCount: length,
            position: currentPage,
            decorator: const DotsDecorator(
              activeColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildNextButton(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 20,
      child: TextButton(
        onPressed: () async {
          if (currentPage < (length - 1)) {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          } else {
            await getIt<CacheHelper>()
                .saveData(key: AppStrings.onBoardingKey, value: true);
            await Navigators.pushNamedAndRemoveUntil(Routes.homeScreen,);
          }
        },
        child: Text(
          currentPage < (length - 1) ? 'Next' : 'Go Home',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Align buildSkipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () async {
          await getIt<CacheHelper>()
              .saveData(key: AppStrings.onBoardingKey, value: true);
          await Navigators.pushNamedAndRemoveUntil(Routes.homeScreen);
        },
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
