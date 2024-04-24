import 'package:dots_indicator/dots_indicator.dart';
import 'package:movie_app/core/themes/styles.dart';
import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/lib_imports.dart';

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
        padding:  const EdgeInsets.only(top: AppSizes.kDefaultPadding200, left: AppSizes.kDefaultPadding20, right: AppSizes.kDefaultPadding20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.kTextFont30Bold.copyWith(
                color: Colors.white,
              )
            ),
            const SizedBox(
              height: AppSizes.kDefaultHeight20,
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyles.font18NormalGrey
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildDotsIndicator() {
    return Positioned(
      bottom: AppSizes.kDefaultPadding20,
      left: AppSizes.kDefaultPadding20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DotsIndicator(
            dotsCount: length,
            position: currentPage.toInt(),
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
      bottom: AppSizes.kDefaultPadding10,
      right: AppSizes.kDefaultPadding20,
      child: TextButton(
        onPressed: () async {
          if (currentPage < (length - 1)) {
            controller.nextPage(
              duration: const Duration(milliseconds: AppSizes.duration300),
              curve: Curves.easeIn,
            );
          } else {
            await getIt<SharedPreCacheHelper>()
                .saveData(key: AppStrings.onBoardingKey, value: true);
            await Navigators.pushNamedAndRemoveUntil(Routes.home);
          }
        },
        child: Text(
          currentPage < (length - 1) ? AppStrings.next : AppStrings.goHome,
          style: TextStyles.font18Normal.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
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
          await getIt<SharedPreCacheHelper>()
              .saveData(key: AppStrings.onBoardingKey, value: true);
          await Navigators.pushNamedAndRemoveUntil(Routes.home);
        },
        child: Text(
          AppStrings.skip,
          style: TextStyles.font18Normal.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
