

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
