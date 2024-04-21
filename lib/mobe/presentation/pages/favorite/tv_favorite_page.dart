import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/mobe/presentation/widgets/favorite/tv_favorite_body.dart';

class TvFavoritePage extends StatelessWidget {
  const TvFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.tvFavorites),
      ),
      body: const TvFavoriteBody(),
    );
  }
}
