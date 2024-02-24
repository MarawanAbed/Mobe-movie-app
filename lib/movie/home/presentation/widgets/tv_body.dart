import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/movie/home/presentation/widgets/build_item_images.dart';

import '../widgets/row_view_all.dart';

class TvBody extends StatelessWidget {
  const TvBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          RowViewAll(
            title: 'Airing Today',
            onTap: () {
              Navigators.pushNamed(Routes.viewAllScreen, arguments: {
                'title': 'Airing Today',
                'isMovie': false,
              });
            },
          ),
          HelperMethod.verticalSpace(20),
          const BuildItemImages(),
          HelperMethod.verticalSpace(20),
          RowViewAll(
            title: 'Popular',
            onTap: () {
              Navigators.pushNamed(Routes.viewAllScreen, arguments: {
                'title': 'Popular',
                'isMovie': false,
              });
            },
          ),
          HelperMethod.verticalSpace(20),
          const BuildItemImages(),
          HelperMethod.verticalSpace(20),
          RowViewAll(
            title: 'Top Rated',
            onTap: () {
              Navigators.pushNamed(Routes.viewAllScreen, arguments: {
                'title': 'Top Rated',
                'isMovie': false,
              });
            },
          ),
          HelperMethod.verticalSpace(20),
          const BuildItemImages(),
        ],
      ),
    );
  }
}
