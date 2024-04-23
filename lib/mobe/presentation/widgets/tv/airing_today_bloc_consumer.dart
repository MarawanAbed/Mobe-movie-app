import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/mobe/presentation/bloc/tv/airing_today/get_airing_today_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/tv/tv_airing_today.dart';

class AiringTodayBlocConsumer extends StatelessWidget {
  const AiringTodayBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var allTvs = context.read<GetAiringTodayCubit>().tvs;
    return BlocConsumer<GetAiringTodayCubit, GetAiringTodayState>(
      buildWhen: (previous, current) =>
          current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tvs) {
            allTvs.addAll(tvs);
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          paginationLoading: ()=>AiringTodayTv(tvs: allTvs),
          loaded: (tvs) {
            return AiringTodayTv(tvs: allTvs);
          },
          error: (error) => Center(
            child: Text(error),
          )
        );
      },
    );
  }
}
