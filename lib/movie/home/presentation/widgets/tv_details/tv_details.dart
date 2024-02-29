import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/data/models/tv_details_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/info_items.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/similar_tv_bloc_builder.dart';

class TvDetails extends StatelessWidget {
  const TvDetails({super.key, required this.tv});
  final TvDetailsModel tv;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            tv.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Text(
            'Season:${tv.numberOfSeasons}  Episode:${tv.numberOfSeasons}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Row(
            children: [
              InfoItems(
                releaseDate: tv.firstAirDate,
                voteAverage: tv.voteAverage,
              ),
              HelperMethod.horizontalSpace(20),
            ],
          ),
          HelperMethod.verticalSpace(10),
          Text(
            tv.overview,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Text(
            'Genres : ${HelperMethod.showGenres(tv.genres)}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          HelperMethod.verticalSpace(20),
          const Text(
            'More Like This',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          SimilarTvBlocBuilder(id: tv.id),
        ],
      ),
    );
  }
}
