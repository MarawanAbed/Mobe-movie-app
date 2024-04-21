

import '../../../../../lib_imports.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key, required this.title, required this.isMovie, this.movies, this.tv});

  final String title;
  final bool isMovie;
  final List<MovieModel>?movies;
  final List<TvModel>?tv;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        appBar: AppBar(
          title: Text('$title ${isMovie ? AppStrings.movie : AppStrings.tv}'),
        ),
        body: ViewAllBody(
          isMovie: isMovie,
          movies: movies,
          tv: tv,
        ),
      ),
    );
  }
}
