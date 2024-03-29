import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/presentation/widgets/type/type_body.dart';

class TypePage extends StatelessWidget {
  const TypePage({super.key, required this.title, required this.isMovie, required this.id});
  final String title;
  final bool isMovie;
  final int id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$title ${isMovie?AppStrings.movie:AppStrings.tv}'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: TypeBody(
            id:id,
            isMovie: isMovie,
          ),
        ),
      ),
    );
  }
}
