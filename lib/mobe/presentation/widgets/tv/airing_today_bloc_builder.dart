import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/mobe/presentation/bloc/tv/airing_today/get_airing_today_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/tv/tv_airing_today.dart';

class AiringTodayBlocBuilder extends StatelessWidget {
  const AiringTodayBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAiringTodayCubit, GetAiringTodayState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tv) {
            return AiringTodayTv(
              tv: tv ?? [],
            );
          },
          error: (error) => Center(
            child: Text(error),
          ),
        );
      },
    );
  }
}
