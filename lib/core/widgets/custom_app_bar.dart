

import 'package:fluttertoast/fluttertoast.dart';

import '../../lib_imports.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.favorite});

  final FavoriteModel favorite;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    var movieBox = Hive.box<FavoriteModel>(AppStrings.favoriteMovie);
    var tvBox = Hive.box<FavoriteModel>(AppStrings.favoriteTv);
    var favoriteMovie = movieBox.get(widget.favorite.id);
    var favoriteTv = tvBox.get(widget.favorite.id);
    isFavorite = favoriteMovie != null || favoriteTv != null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          GestureDetector(
            onTap: () async {
              var movieBox = Hive.box<FavoriteModel>(AppStrings.favoriteMovie);
              var tvBox = Hive.box<FavoriteModel>(AppStrings.favoriteTv);
              var favoriteMovie = movieBox.get(widget.favorite.id);
              var favoriteTv = tvBox.get(widget.favorite.id);

              if (favoriteMovie != null || favoriteTv != null) {
                movieBox.delete(widget.favorite.id);
                tvBox.delete(widget.favorite.id);
                HelperMethod.showErrorToast(AppStrings.removedFromFavorites,
                    gravity: ToastGravity.BOTTOM);
                setState(() {
                  isFavorite = false;
                });
              } else {
                if (widget.favorite.isMovie) {
                  movieBox.put(widget.favorite.id, widget.favorite);
                } else {
                  tvBox.put(widget.favorite.id, widget.favorite);
                }
                HelperMethod.showSuccessToast(AppStrings.addedToFavorites,
                    gravity: ToastGravity.BOTTOM);
                setState(() {
                  isFavorite = true;
                });
              }
            },            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
