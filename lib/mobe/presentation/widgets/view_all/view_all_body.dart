
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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ViewAllItems(
          screen: isMovie ? Routes.movieDetails : Routes.tvDetails,
          arguments: isMovie ? movies![index].id : tv![index].id,
          isMovie: isMovie,
          movie: isMovie ? movies![index] : null,
          tv: isMovie ? null : tv![index],
        ),
        separatorBuilder: (context, index) => HelperMethod.verticalSpace(20),
        itemCount: isMovie ? movies!.length : tv!.length,
      ),
    );
  }
}
