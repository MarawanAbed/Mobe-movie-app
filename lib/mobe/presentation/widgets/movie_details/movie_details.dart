
import 'package:movie_app/mobe/presentation/widgets/movie_details/similar_movies_bloc_builder.dart';

import '../../../../../lib_imports.dart';

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
            movies.title??'No Title',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Row(
            children: [
              InfoItems(
                releaseDate: movies.releaseDate??'No Date',
                voteAverage: movies.voteAverage??0.0,
              ),
              HelperMethod.horizontalSpace(20),
              Text(
                HelperMethod.showDuration(movies.runTime??0),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          HelperMethod.verticalSpace(10),
          Text(
            movies.overview??'No Overview',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Text('${AppStrings.genre} : ${HelperMethod.showGenres(movies.genres??[])}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              )),
          HelperMethod.verticalSpace(20),
          const Text(
            AppStrings.moreLikeThis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          SimilarMoviesBlocBuilder(id: movies.id??0),
        ],
      ),
    );
  }
}
