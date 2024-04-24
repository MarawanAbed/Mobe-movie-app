import 'package:movie_app/lib_imports.dart';

class TvFavoritePage extends StatelessWidget {
  const TvFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundNavBar,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.tvFavorites),
      ),
      body: const TvFavoriteBody(),
    );
  }
}
