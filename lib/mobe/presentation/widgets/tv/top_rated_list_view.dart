import 'package:movie_app/mobe/presentation/bloc/tv/top_rated/get_tv_top_rated_cubit.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/utils/sizes.dart';

class TopRatedListView extends StatefulWidget {
  const TopRatedListView({super.key, required this.tvs});

  final List<TvModel> tvs;

  @override
  State<TopRatedListView> createState() => _TopRatedListViewState();
}

class _TopRatedListViewState extends State<TopRatedListView> {
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
      context.read<GetTvTopRatedCubit>().getTopRatedTv();
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
        separatorBuilder: (context, index) => const SizedBox(width: AppSizes.kDefaultWidth15),
      ),
    );
  }
}
