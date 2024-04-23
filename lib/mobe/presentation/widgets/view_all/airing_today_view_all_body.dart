import 'package:movie_app/mobe/presentation/bloc/tv/view_all/get_tv_airing_today_view_all_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/view_all_items.dart';

import '../../../../lib_imports.dart';

class AiringTodayViewAllBody extends StatefulWidget {
  const AiringTodayViewAllBody({super.key, required this.tvs});

  final List<TvModel> tvs;

  @override
  State<AiringTodayViewAllBody> createState() => _AiringTodayViewAllBodyState();
}

class _AiringTodayViewAllBodyState extends State<AiringTodayViewAllBody> {
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
      context.read<GetTvAiringTodayViewAllCubit>().getTvAiringTodayViewAll();
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
          screen: Routes.tvDetails,
          arguments: widget.tvs[index].id,
          isMovie: false,
          tv: widget.tvs[index],
        ),
        separatorBuilder: (context, index) => HelperMethod.verticalSpace(20),
        itemCount: widget.tvs.length,
      ),
    );
  }
}
