import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/view_all_items.dart';

import '../../../../../lib_imports.dart';
import '../../../bloc/movie/view_all/get_popular_view_all_movies_cubit.dart';

class PopularViewAllBody extends StatefulWidget {
  const PopularViewAllBody({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<PopularViewAllBody> createState() => _PopularViewAllBodyState();
}

class _PopularViewAllBodyState extends State<PopularViewAllBody> {
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
      context.read<GetPopularViewAllMoviesCubit>().getPopularMoviesViewAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.kDefaultPadding20),
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) => ViewAllItems(
          screen: Routes.movieDetails,
          arguments: widget.movies[index].id,
          isMovie: true,
          movie: widget.movies[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: AppSizes.kDefaultHeight20,
        ),
        itemCount: widget.movies.length,
      ),
    );
  }
}
