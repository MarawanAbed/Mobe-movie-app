
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../lib_imports.dart';
import 'movie_details.dart';
import 'movie_poster.dart';

class MoviesDetailsItems extends StatelessWidget {
  const MoviesDetailsItems({
    super.key,
    required this.movies,
  });

  final MovieDetailsModel movies;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: FadeInImage(
            placeholder: const AssetImage(AppImages.placeholder),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            image: CachedNetworkImageProvider(image + (movies.backdropPath??AppImages.placeholder)),
            fit: BoxFit.contain,
          ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  favorite: FavoriteModel(
                    id: movies.id!,
                    title: movies.title!,
                    voteAverage: movies.voteAverage,
                    posterPath: movies.posterPath!,
                    releaseDate: movies.releaseDate!,
                    overview: movies.overview!,
                    isMovie: true,
                  ),
                ),
                HelperMethod.verticalSpace(60),
                MoviePoster(movies: movies),
                HelperMethod.verticalSpace(30),
                MovieDetails(movies: movies),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
