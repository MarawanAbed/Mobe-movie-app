import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/movie/home/presentation/widgets/favorite/movies_favorite_body.dart';

class MoviesFavoritePage extends StatelessWidget {
  const MoviesFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.moviesFavorites),
      ),
      body: const SingleChildScrollView(child: MoviesFavoriteBody()),
    );
  }
}
