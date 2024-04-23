import 'package:movie_app/mobe/presentation/bloc/movie/similar/similar_movies_cubit.dart';

import '../../../../lib_imports.dart';

class SimilarListView extends StatefulWidget {
  const SimilarListView({super.key, required this.movies, required this.id});

  final List<MovieModel> movies;
  final int id;

  @override
  State<SimilarListView> createState() => _SimilarListViewState();
}

class _SimilarListViewState extends State<SimilarListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<SimilarMoviesCubit>().getSimilarMovies(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return ImageItems(
            screen: Routes.movieDetails,
            image: ApiConstant.imageBaseUrl +
                (widget.movies[index].posterPath ?? AppImages.placeholder),
            arguments: widget.movies[index].id,
          );
        },
        separatorBuilder: (context, index) => HelperMethod.horizontalSpace(10),
      ),
    );
  }
}
