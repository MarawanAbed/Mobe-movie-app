import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/genre/genre_body.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("$title Genre"),
        ),
        body: SingleChildScrollView(
          child: GenreBody(
            title: title,
          ),
        ),
      ),
    );
  }
}

