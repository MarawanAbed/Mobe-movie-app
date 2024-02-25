import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_details_body.dart';

import '../../../../core/themes/app_colors.dart';

class TvPageDetails extends StatelessWidget {
  const TvPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        body: TvDetailsBody(),
      ),
    );
  }
}
