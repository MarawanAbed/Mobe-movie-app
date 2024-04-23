

import '../../../../../lib_imports.dart';

class BuildSearchMovies extends StatelessWidget {
  const BuildSearchMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (index < movies.length) {
          return Expanded(
            child: ImageItems(
              image: image + (movies[index].posterPath??AppImages.placeholder),
              screen: Routes.movieDetails,
              arguments: movies[index].id,
            ),
          );
        } else {
          return Expanded(
            child: Image.asset(
              AppImages.placeholder,
              fit: BoxFit.cover,
            ),
          );
        }
      },
      itemCount: movies.length,
    );
  }
}