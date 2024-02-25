import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';

class GenreBody extends StatefulWidget {
  const GenreBody({super.key, required this.title, required this.isMovie});

  final String title;
  final bool isMovie;

  @override
  State<GenreBody> createState() => _GenreBodyState();
}

class _GenreBodyState extends State<GenreBody> {
  final List<String> movieGenre = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Music',
    'Mystery',
    'Romance',
    'Science Fiction',
    'TV Movie',
    'Thriller',
    'War',
    'Western',
  ];

  final List<String> tvGenre = [
    'Action & Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Kids',
    'Mystery',
    'News',
    'Reality',
    'Sci-Fi & Fantasy',
    'Soap',
    'Talk',
    'War & Politics',
    'Western',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title == 'Movie')
          ...movieGenre
              .map((e) => GenreItem(
                    title: e,
                    isMovie: widget.isMovie,
                  ))
              .toList(),
        if (widget.title == 'Tv')
          ...tvGenre
              .map((e) => GenreItem(
                    title: e,
                    isMovie: widget.isMovie,
                  ))
              .toList(),
      ],
    );
  }
}

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, required this.title, required this.isMovie});

  final String title;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigators.pushNamed(Routes.type,
            arguments: {'title': title, 'isMovie': isMovie});
      },
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
