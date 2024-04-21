

import '../../../../../lib_imports.dart';
import 'favorites_items.dart';

class BuildFavoritesItems extends StatelessWidget {
  const BuildFavoritesItems(
      {super.key, this.movies, this.tv, required this.isMovie});

  final List<FavoriteModel>? movies;
  final List<FavoriteModel>? tv;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => FavoritesItems(
          favorite: isMovie ? movies![index] : tv![index],
          screen: isMovie ? Routes.movieDetails : Routes.tvDetails,
          arguments: isMovie ? movies![index].id : tv![index].id,
        ),
        separatorBuilder: (context, index) => HelperMethod.verticalSpace(20),
        itemCount: isMovie ? movies!.length : tv!.length,
      ),
    );
  }
}
