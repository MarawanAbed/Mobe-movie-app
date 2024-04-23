import 'package:movie_app/mobe/presentation/bloc/tv/similar/similar_tv_cubit.dart';

import '../../../../lib_imports.dart';

class SimilarTvListView extends StatefulWidget {
  const SimilarTvListView({super.key, required this.tvs, required this.id});

  final List<TvModel> tvs;
  final int id;

  @override
  State<SimilarTvListView> createState() => _SimilarTvListViewState();
}

class _SimilarTvListViewState extends State<SimilarTvListView> {
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
      context.read<SimilarTvCubit>().getSimilarTv(widget.id);
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
        itemCount: widget.tvs.length,
        itemBuilder: (context, index) {
          return ImageItems(
            screen: Routes.tvDetails,
            image: ApiConstant.imageBaseUrl +
                (widget.tvs[index].posterPath ?? AppImages.placeholder),
            arguments: widget.tvs[index].id,
          );
        },
        separatorBuilder: (context, index) => HelperMethod.horizontalSpace(10),
      ),
    );
  }
}
