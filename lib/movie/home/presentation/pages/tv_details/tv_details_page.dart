import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_details_body.dart';

import '../../../../../core/themes/app_colors.dart';

class TvPageDetails extends StatelessWidget {
  const TvPageDetails({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        body: TvDetailsBody(
          id: id,
        ),
      ),
    );
  }
}
