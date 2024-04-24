import 'package:movie_app/core/widgets/no_data.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/tv/details/get_tv_details_cubit.dart';

class TvDetailsBlocBuilder extends StatefulWidget {
  const TvDetailsBlocBuilder({super.key, required this.id});

  final int id;

  @override
  State<TvDetailsBlocBuilder> createState() => _TvDetailsBlocBuilderState();
}

class _TvDetailsBlocBuilderState extends State<TvDetailsBlocBuilder> {
  @override
  void initState() {
    context.read<GetTvDetailsCubit>().getTvDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvDetailsCubit, GetTvDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tv) {
            if (tv != null) {
              return TvDetailsItems(tv: tv);
            } else {
              return const NoDataWidget();
            }
          },
          error: (error) => const NoDataWidget(),
        );
      },
    );
  }
}
