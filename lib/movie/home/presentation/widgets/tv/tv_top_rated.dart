import 'package:flutter/material.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/build_item_images.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/row_view_all.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/routes/routes.dart';

class TopRatedTv extends StatelessWidget {
  const TopRatedTv({super.key, required this.tv});

  final List<TvModel> tv;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title: AppStrings.topRated,
          onTap: () {
            Navigators.pushNamed(Routes.viewAll, arguments: {
              'title': AppStrings.topRated,
              'tv': tv,
              'isMovie': false,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        BuildItemImages(
          tv: tv,
          screen: Routes.tvDetails,
        ),
      ],
    );
  }
}
