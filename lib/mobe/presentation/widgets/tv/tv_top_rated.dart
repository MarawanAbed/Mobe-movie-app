

import 'package:movie_app/mobe/presentation/widgets/tv/top_rated_list_view.dart';

import '../../../../../lib_imports.dart';

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
            Navigators.pushNamed(Routes.topRatedTvViewAll, arguments: {
              'title': AppStrings.topRated,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        TopRatedListView(
          tvs: tv,
        ),
      ],
    );
  }
}
