import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/gallery_3d.dart';
import 'package:movie_app/movie/home/presentation/widgets/row_view_all.dart';

class TvPage extends StatelessWidget {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: TvBody(),
        ),
      ),
    );
  }
}

class TvBody extends StatelessWidget {
  const TvBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const RowViewAll(title: 'Upcoming Tv Shows'),
          HelperMethod.verticalSpace(20),
          const Gallery3DItems(),
          HelperMethod.verticalSpace(20),
          const RowViewAll(title: 'Popular Tv Shows'),
          HelperMethod.verticalSpace(20),
          const Gallery3DItems(),
          HelperMethod.verticalSpace(20),
          const RowViewAll(title: 'Top Rated Tv Shows'),
          HelperMethod.verticalSpace(20),
          const Gallery3DItems(),
        ],
      ),
    );
  }
}
