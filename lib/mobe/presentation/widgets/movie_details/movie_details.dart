import 'package:movie_app/mobe/presentation/widgets/movie_details/similar_movies_bloc_builder.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/themes/styles.dart';
import '../../../../core/utils/sizes.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.movies,
  });

  final MovieDetailsModel movies;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<GenresModel>noGenre = [GenresModel(id: 0, name: 'No Genre')];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.kDefaultPadding10,
        horizontal: AppSizes.kDefaultPadding20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.movies.title ?? 'No Title',
            style: TextStyles.kTextFont24Bold,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Row(
            children: [
              InfoItems(
                releaseDate: widget.movies.releaseDate ?? 'No Date',
                voteAverage: widget.movies.voteAverage ?? 0.0,
              ),
              const SizedBox(
                width: AppSizes.kDefaultWidth20,
              ),
              Text(
                HelperMethod.showDuration(widget.movies.runTime ?? 0),
                style: TextStyles.font16NormalGrey,
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            widget.movies.overview!.isEmpty ? 'No Overview' : widget.movies.overview!,
            style: TextStyles.font16NormalGrey,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            '${AppStrings.genre} : ${HelperMethod.showGenres(widget.movies.genres??noGenre)}',
            style: TextStyles.font16NormalGrey.copyWith(
              color: Colors.white54,
            ),
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight20,
          ),
           Text(
            AppStrings.moreLikeThis,
            style: TextStyles.font20Bold,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight20,
          ),
          SimilarMoviesBlocConsumer(id: widget.movies.id ?? 0),
        ],
      ),
    );
  }
}
