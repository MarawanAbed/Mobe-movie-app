import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/custom_app_bar.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/movie_details.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/movie_poster.dart';

class HomeDetailsBody extends StatelessWidget {
  const HomeDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/oBIQDKcqNxKckjugtmzpIIOgoc4.jpg',
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
                const MoviePoster(),
                HelperMethod.verticalSpace(30),
                const MovieDetails(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
