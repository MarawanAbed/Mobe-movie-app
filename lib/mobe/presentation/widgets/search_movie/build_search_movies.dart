

import 'package:movie_app/mobe/presentation/bloc/movie/search/search_movies_cubit.dart';

import '../../../../../lib_imports.dart';

class BuildSearchMovies extends StatefulWidget {
  const BuildSearchMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<BuildSearchMovies> createState() => _BuildSearchMoviesState();
}

class _BuildSearchMoviesState extends State<BuildSearchMovies> {
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
      context
          .read<SearchMoviesCubit>()
          .searchMovies(context.read<SearchMoviesCubit>().query);
    }
  }

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (index < widget.movies.length) {
          return ImageItems(
            image: image + (widget.movies[index].posterPath??AppImages.placeholder),
            screen: Routes.movieDetails,
            arguments: widget.movies[index].id,
          );
        } else {
          return Image.asset(
            AppImages.placeholder,
            fit: BoxFit.cover,
          );
        }
      },
      itemCount: widget.movies.length,
    );
  }
}