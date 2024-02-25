import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/custom_app_bar.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_details.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_poster.dart';

class TvDetailsBody extends StatelessWidget {
  const TvDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/lvgsNKgf6wMItoPCJMliFNUB0Yp.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
          ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const CustomAppBar(),
                HelperMethod.verticalSpace(60),
                const TvPoster(),
                HelperMethod.verticalSpace(30),
                const TvDetails(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
