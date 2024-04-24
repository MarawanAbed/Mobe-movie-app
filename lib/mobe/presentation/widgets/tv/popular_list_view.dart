import 'package:movie_app/mobe/presentation/bloc/tv/popular/get_tv_popular_cubit.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/utils/sizes.dart';

class PopularListView extends StatefulWidget {
  const PopularListView({super.key, required this.tvs});

  final List<TvModel> tvs;

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
      context.read<GetTvPopularCubit>().getPopularTv();
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
