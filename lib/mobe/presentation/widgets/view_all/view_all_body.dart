
import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/view_all_items.dart';

import '../../../../../lib_imports.dart';

class ViewAllBody extends StatelessWidget {
  const ViewAllBody({super.key, required this.isMovie, this.tv, this.movies});

  final bool isMovie;
  final List<TvModel>?tv;
  final List<MovieModel>?movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.kDefaultPadding20),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ViewAllItems(
          screen: isMovie ? Routes.movieDetails : Routes.tvDetails,
          arguments: isMovie ? movies![index].id : tv![index].id,
          isMovie: isMovie,
          movie: isMovie ? movies![index] : null,
          tv: isMovie ? null : tv![index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: AppSizes.kDefaultHeight20,
        ),
        itemCount: isMovie ? movies!.length : tv!.length,
      ),
    );
  }
}
