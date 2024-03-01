import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv/airing_today_bloc_builder.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv/popular_bloc_builder.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv/top_rated_bloc_builder.dart';

class TvBody extends StatelessWidget {
  const TvBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AiringTodayBlocBuilder(),
              HelperMethod.verticalSpace(20),
              const PopularBlocBuilder(),
              HelperMethod.verticalSpace(20),
              const TopRatedBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
