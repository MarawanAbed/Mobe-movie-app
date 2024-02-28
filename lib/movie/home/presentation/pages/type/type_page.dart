import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/type/type_body.dart';

class TypePage extends StatelessWidget {
  const TypePage({super.key, required this.title, required this.isMovie});
  final String title;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$title Page'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: TypeBody(
            isMovie: isMovie,
          ),
        ),
      ),
    );
  }
}
