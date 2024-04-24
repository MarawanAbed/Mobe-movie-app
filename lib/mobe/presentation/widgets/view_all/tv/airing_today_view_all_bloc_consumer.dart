import 'package:movie_app/mobe/presentation/bloc/tv/view_all/get_tv_airing_today_view_all_cubit.dart';

import '../../../../../lib_imports.dart';
import 'airing_today_view_all_body.dart';

class AiringTodayViewAllBlocConsumer extends StatelessWidget {
  const AiringTodayViewAllBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetTvAiringTodayViewAllCubit>().tvs;
    return BlocConsumer<GetTvAiringTodayViewAllCubit,
        GetTvAiringTodayViewAllState>(
      buildWhen: (previous, current) =>
          current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tv) {
            cubit.addAll(tv);
          },
        );
      },
      builder: (context, state) {
        return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            paginationLoading: ()=> AiringTodayViewAllBody(
              tvs: cubit,
            ),
            loaded: (tv) {
              return AiringTodayViewAllBody(
                tvs: cubit,
              );
            },
            error: (error) => Center(
              child: Text(error),
            )
        );
      },
    );
  }
}
