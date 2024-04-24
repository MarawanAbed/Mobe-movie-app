

import 'package:movie_app/mobe/presentation/widgets/tv/popular_list_view.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/utils/sizes.dart';

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
            Navigators.pushNamed(Routes.popularTvViewAll, arguments: {
              'title':AppStrings.popular,
            });
          },
        ),
        const SizedBox(
          height: AppSizes.kDefaultHeight20,
        ),
        PopularListView(
          tvs: tv,
        ),
      ],
    );
  }
}
