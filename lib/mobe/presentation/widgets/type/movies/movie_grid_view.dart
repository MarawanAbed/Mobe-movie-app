
import '../../../../../../lib_imports.dart';
import '../../../Bloc/movie/by_genre/get_movies_by_genre_cubit.dart';

class TypeMovieGridView extends StatefulWidget {
  const TypeMovieGridView({super.key, required this.movies, required this.id});

  final List<MovieModel>movies;
  final int id;
  @override
  State<TypeMovieGridView> createState() => _TypeMovieGridViewState();
}

class _TypeMovieGridViewState extends State<TypeMovieGridView> {

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
      context.read<GetMoviesByGenreCubit>().getMoviesByGenre(widget.id);
    }
  }
  @override
  Widget build(BuildContext context) {
    const image=ApiConstant.imageBaseUrl;
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ImageItems(
        image:  image+(widget.movies[index].posterPath??AppImages.placeholder),
        screen:Routes.movieDetails,
        arguments:  widget.movies[index].id,
      ),
      itemCount: widget.movies.length,
    );
  }
}
