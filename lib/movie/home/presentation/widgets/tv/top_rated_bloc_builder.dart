import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/top_rated/get_tv_top_rated_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv/tv_top_rated.dart';


class TopRatedBlocBuilder extends StatelessWidget {
  const TopRatedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvTopRatedCubit, GetTvTopRatedState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tv) {
            return TopRatedTv(
              tv: tv,
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
