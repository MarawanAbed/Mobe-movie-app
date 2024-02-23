import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/gallery_3d.dart';

import '../widgets/row_view_all.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: MovieBody(),
        ),
      ),
    );
  }
}

class MovieBody extends StatelessWidget {
  const MovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const RowViewAll(title: 'Upcoming Movies'),
          HelperMethod.verticalSpace(20),
          const Gallery3DItems(),
          HelperMethod.verticalSpace(20),
          const RowViewAll(title: 'Popular Movies'),
          HelperMethod.verticalSpace(20),
          const Gallery3DItems(),
          HelperMethod.verticalSpace(20),
          const RowViewAll(title: 'Top Rated Movies'),
          HelperMethod.verticalSpace(20),
          const Gallery3DItems(),
        ],
      ),
    );
  }
}
