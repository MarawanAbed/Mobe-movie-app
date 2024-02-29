import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/movie_details_body.dart';

import '../../../../../core/themes/app_colors.dart';

class MoviePageDetails extends StatelessWidget {
  const MoviePageDetails({super.key, required this.id, });
  final int id;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        body: MovieDetailsBody(
          id: id,
        ),
      ),
    );
  }
}
