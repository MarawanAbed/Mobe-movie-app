import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/search/search_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/search_tv/build_search_movies.dart';

class SearchTvBlocBuilder extends StatelessWidget {
  const SearchTvBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTvCubit, SearchTvState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Expanded(
            child: Center(
              child: Text('Search for TvSeries'),
            ),
          ),
          loaded: (tv) {
            return tv.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text('No Movies Found'),
                    ),
                  )
                : Expanded(
                    child: BuildSearchTv(
                      tv: tv,
                    ),
                  );
          },
          error: (message) => const Expanded(
            child: Center(
              child: Text('No TvSeries Found'),
            ),
          ),
        );
      },
    );
  }
}
