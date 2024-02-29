import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_details_bloc_builder.dart';

class TvDetailsBody extends StatelessWidget {
  const TvDetailsBody({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return TvDetailsBlocBuilder(id: id);
  }
}
