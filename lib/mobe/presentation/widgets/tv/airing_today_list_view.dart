import 'package:movie_app/mobe/presentation/bloc/tv/airing_today/get_airing_today_cubit.dart';

import '../../../../../lib_imports.dart';

class AiringTodayListView extends StatefulWidget {
  const AiringTodayListView({super.key, required this.tvs});

  final List<TvModel> tvs;

  @override
  State<AiringTodayListView> createState() => _AiringTodayListViewState();
}

class _AiringTodayListViewState extends State<AiringTodayListView> {
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
      context.read<GetAiringTodayCubit>().getAiringToday();
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
