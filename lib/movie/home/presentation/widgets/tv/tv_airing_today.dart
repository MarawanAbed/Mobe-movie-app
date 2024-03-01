import 'package:flutter/material.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/row_view_all.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/routes/routes.dart';
import '../commmon/build_item_images.dart';

class AiringTodayTv extends StatelessWidget {
  const AiringTodayTv({super.key, required this.tv});

  final List<TvModel> tv;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title:AppStrings.airingToday,
          onTap: () {
            Navigators.pushNamed(Routes.viewAll, arguments: {
              'title': AppStrings.airingToday,
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
