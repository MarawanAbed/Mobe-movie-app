import 'package:movie_app/lib_imports.dart';


class MoviesFavoritePage extends StatelessWidget {
  const MoviesFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundNavBar,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.moviesFavorites),
      ),
      body: const MoviesFavoriteBody(),
    );
  }
}
