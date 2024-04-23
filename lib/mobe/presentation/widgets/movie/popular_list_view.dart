import 'package:movie_app/mobe/presentation/bloc/movie/popular/get_popular_movies_cubit.dart';

import '../../../../lib_imports.dart';

class PopularListView extends StatefulWidget {
  const PopularListView({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<PopularListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<PopularListView> {
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
      context.read<GetPopularMoviesCubit>().getPopularMovies();
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
