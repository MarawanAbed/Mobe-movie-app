import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/bloc/tv/view_all/get_tv_top_rated_view_all_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/view_all_items.dart';

import '../../../../../lib_imports.dart';


class TopRatedTvViewAllBody extends StatefulWidget {
  const TopRatedTvViewAllBody({super.key, required this.tvs});

  final List<TvModel> tvs;

  @override
  State<TopRatedTvViewAllBody> createState() => _TopRatedTvViewAllBodyState();
}

class _TopRatedTvViewAllBodyState extends State<TopRatedTvViewAllBody> {
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
      context.read<GetTvTopRatedViewAllCubit>().getTvTopRatedViewALl();
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
          screen: Routes.tvDetails,
          arguments: widget.tvs[index].id,
          isMovie: false,
          tv: widget.tvs[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: AppSizes.kDefaultHeight20,
        ),
        itemCount: widget.tvs.length,
      ),
    );
  }
}
