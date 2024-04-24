import '../../../../../../lib_imports.dart';
import '../../../bloc/tv/by_genre/get_tv_by_genre_cubit.dart';

class TypeTvGridView extends StatefulWidget {
  const TypeTvGridView({super.key, required this.tvs, required this.id});

  final List<TvModel> tvs;
  final int id;

  @override
  State<TypeTvGridView> createState() => _TypeTvGridViewState();
}

class _TypeTvGridViewState extends State<TypeTvGridView> {
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
      context.read<GetTvByGenreCubit>().getTvByGenre(widget.id);
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
      itemBuilder: (context, index) => ImageItems(
        image: image + (widget.tvs[index].posterPath ?? AppImages.placeholder),
        screen: Routes.tvDetails,
        arguments: widget.tvs[index].id,
      ),
      itemCount: widget.tvs.length,
    );
  }
}
