

import '../../../../../lib_imports.dart';
import 'genre_item.dart';

class BuildGenreItems extends StatelessWidget {
  const BuildGenreItems({
    super.key,
    required this.isMovie,
    required this.genres,
  });

  final List<GenresModel> genres;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GenreItem(
          title: genres[index].name??'No Title',
          isMovie: isMovie,
          id: genres[index].id??0,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: genres.length,
    );
  }
}
