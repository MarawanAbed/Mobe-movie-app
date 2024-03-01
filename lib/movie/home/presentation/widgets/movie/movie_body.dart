import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie/popular_bloc_builder.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie/top_rated_bloc_builder.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie/up_coming_bloc_builder.dart';

class MovieBody extends StatelessWidget {
  const MovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UpComingBlocBuilder(),
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
