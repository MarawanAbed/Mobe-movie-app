import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/genre/genre_body.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key, required this.title, required this.isMovie});
  final String title;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("$title Genre"),
        ),
        body: GenreBody(
          title: title,
          isMovie: isMovie,
        ),
      ),
    );
  }
}

