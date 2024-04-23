

import 'package:movie_app/mobe/presentation/widgets/tv/airing_today_list_view.dart';

import '../../../../../lib_imports.dart';

class AiringTodayTv extends StatelessWidget {
  const AiringTodayTv({super.key, required this.tvs});

  final List<TvModel> tvs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title:AppStrings.airingToday,
          onTap: () {
            Navigators.pushNamed(Routes.airingTodayViewAll, arguments: {
              'title': AppStrings.airingToday,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        AiringTodayListView(tvs: tvs),
      ],
    );
  }
}
