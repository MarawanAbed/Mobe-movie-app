import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/upcoming_view_all_body.dart';

import '../../bloc/movie/view_all/get_up_coming_view_all_movies_cubit.dart';

class UpComingMoviesViewALlBlocConsumer extends StatelessWidget {
  const UpComingMoviesViewALlBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetUpComingViewAllMoviesCubit>();
    return BlocConsumer<GetUpComingViewAllMoviesCubit,
        GetUpComingViewAllMoviesState>(
      buildWhen: (previous, current) =>
          current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (movies) {
            cubit.viewAllMovies.addAll(movies);
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          paginationLoading: () =>
                UpcomingViewAllBody(movies: cubit.viewAllMovies),
          loaded: (movies) {
            return UpcomingViewAllBody(movies: cubit.viewAllMovies);
          },
          error: (error) => Center(
            child: Text(error),
          ),
        );
      },
    );
  }
}
