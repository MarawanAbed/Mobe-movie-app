import 'package:movie_app/mobe/presentation/bloc/movie/view_all/get_top_rated_view_all_movies_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/view_all_items.dart';

import '../../../../lib_imports.dart';

class TopRatedViewAllBody extends StatefulWidget {
  const TopRatedViewAllBody({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<TopRatedViewAllBody> createState() => _TopRatedViewAllBodyState();
}

class _TopRatedViewAllBodyState extends State<TopRatedViewAllBody> {
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
      context.read<GetTopRatedViewAllMoviesCubit>().getTopRatedMoviesViewAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) => ViewAllItems(
          screen: Routes.movieDetails,
          arguments: widget.movies[index].id,
          isMovie: true,
          movie: widget.movies[index],
        ),
        separatorBuilder: (context, index) => HelperMethod.verticalSpace(20),
        itemCount: widget.movies.length,
      ),
    );
  }
}
