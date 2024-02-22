import 'package:flutter/material.dart';
import 'package:movie_app/movie/onboarding/presentation/widgets/onboarding_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnBoardingScreen(),
      ),
    );
  }
}
