import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';

class CustomAppBarMovieAndTv extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isMovie;
  const CustomAppBarMovieAndTv({super.key, required this.title, required this.isMovie});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppBar(
        elevation: 0,
        title: Text(title),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              if (isMovie) {
                Navigators.pushNamed(Routes.searchMovie);
              } else {
                Navigators.pushNamed(Routes.searchTv);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
