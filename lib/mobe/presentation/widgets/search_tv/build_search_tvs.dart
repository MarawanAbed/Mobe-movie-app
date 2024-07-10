import 'package:movie_app/mobe/presentation/bloc/tv/search/search_tv_cubit.dart';

import '../../../../../lib_imports.dart';

class BuildSearchTv extends StatefulWidget {
  const BuildSearchTv({super.key, required this.tv, required this.query});

  final List<TvModel> tv;
  final String query;

  @override
  State<BuildSearchTv> createState() => _BuildSearchTvState();
}

class _BuildSearchTvState extends State<BuildSearchTv> {
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
          .read<SearchTvCubit>()
          .searchTv(context.read<SearchTvCubit>().query);
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
      itemCount: widget.tv.length,
      itemBuilder: (context, index) {
        return ImageItems(
          image: image + (widget.tv[index].posterPath ?? AppImages.placeholder),
          screen: Routes.tvDetails,
          arguments: widget.tv[index].id,
        );
      },
    );
  }
}
