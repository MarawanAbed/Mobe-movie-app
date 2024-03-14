import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/presentation/widgets/search_movie/search_movie_body.dart';

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.searchMovies),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return child;
            } else {
              return const Center(
                child: Text('No Internet Connection'),
              );
            }
          },
          child: const SearchMovieBody(),
        ),
      ),
    );
  }
}
