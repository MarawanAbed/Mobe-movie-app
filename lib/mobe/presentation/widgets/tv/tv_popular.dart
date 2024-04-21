

import '../../../../../lib_imports.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key, required this.tv});

  final List<TvModel> tv;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title: AppStrings.popular,
          onTap: () {
            Navigators.pushNamed(Routes.viewAll, arguments: {
              'title':AppStrings.popular,
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
