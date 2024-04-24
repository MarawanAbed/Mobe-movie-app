import '../../../../core/utils/sizes.dart';
import '../../../../lib_imports.dart';
import '../../bloc/movie/upcoming/get_up_coming_movies_cubit.dart';

class UpComingListView extends StatefulWidget {
  const UpComingListView({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<UpComingListView> createState() => _UpComingListViewState();
}

class _UpComingListViewState extends State<UpComingListView> {
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
      context.read<GetUpComingMoviesCubit>().getUpComingMovies();
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
        separatorBuilder: (context, index) => const SizedBox(
          width: AppSizes.kDefaultWidth15,
        ),
      ),
    );
  }
}
