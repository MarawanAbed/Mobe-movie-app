import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/build_item_images.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/info_items.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Movie Title',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Row(
            children: [
              const InfoItems(),
              HelperMethod.horizontalSpace(20),
              const Text(
                '1h 30m',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          HelperMethod.verticalSpace(10),
          const Text(
            'Movie Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
          ),
          HelperMethod.verticalSpace(10),
          Row(
            children: [
              const Text(
                'Genres: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              HelperMethod.horizontalSpace(2),
              const Text(
                'Action, Adventure, Drama',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
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
          const BuildItemImages(
            screen: Routes.movieDetails,
          ),
        ],
      ),
    );
  }
}
