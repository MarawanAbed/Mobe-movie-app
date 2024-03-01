import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';
import 'package:movie_app/movie/home/presentation/manager/favorites/favorites_cubit.dart';

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
    var box = Hive.box<FavoriteModel>(AppStrings.favoriteBoxName);
    var favorite = box.get(widget.favorite.id);
    isFavorite = favorite != null;
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
              var cubit = FavoritesCubit.get(context);
              var box = Hive.box<FavoriteModel>(AppStrings.favoriteBoxName);
              var favorite = box.get(widget.favorite.id);
              if (favorite != null) {
                box.delete(widget.favorite.id);
                cubit.removeFavorite(widget.favorite.id);
                HelperMethod.showErrorToast(AppStrings.removedFromFavorites,
                    gravity: ToastGravity.BOTTOM);
                setState(() {
                  isFavorite = false;
                });
              } else {
                box.put(widget.favorite.id, widget.favorite);
                cubit.addFavorite(widget.favorite);
                HelperMethod.showSuccessToast(AppStrings.addedToFavorites,
                    gravity: ToastGravity.BOTTOM);
                setState(() {
                  isFavorite = true;
                });
              }
            },
            child: Icon(
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
