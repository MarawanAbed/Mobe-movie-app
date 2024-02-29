import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/data/models/movie_details_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/info_items.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/similar_movies_bloc_builder.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movies,
  });

  final MovieDetailsModel movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movies.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Row(
            children: [
              InfoItems(
                releaseDate: movies.releaseDate,
                voteAverage: movies.voteAverage,
              ),
              HelperMethod.horizontalSpace(20),
              Text(
                HelperMethod.showDuration(movies.runTime),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          HelperMethod.verticalSpace(10),
          Text(
            movies.overview,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Text('Genres : ${HelperMethod.showGenres(movies.genres)}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              )),
          HelperMethod.verticalSpace(20),
          const Text(
            'More Like This',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          SimilarMoviesBlocBuilder(id: movies.id),
        ],
      ),
    );
  }
}
