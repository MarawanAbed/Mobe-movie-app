import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/no_data.dart';
import 'package:movie_app/mobe/presentation/widgets/search_tv/build_search_tvs.dart';

import '../../../../core/utils/strings.dart';
import '../../bloc/tv/search/search_tv_cubit.dart';

class SearchTvBlocBuilder extends StatelessWidget {
  const SearchTvBlocBuilder({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTvCubit, SearchTvState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Expanded(
            child: Center(
              child: Text(AppStrings.searchTv),
            ),
          ),
          paginationLoading: () => context.read<SearchTvCubit>().tvs.isEmpty
              ? const Expanded(child: NoDataWidget())
              : Expanded(
                  child: BuildSearchTv(
                      query: query, tv: context.read<SearchTvCubit>().tvs),
                ),
          loaded: (tvs) => Expanded(
            child: BuildSearchTv(query: query, tv: tvs),
          ),
          error: (message) => const Expanded(
            child: Center(
              child: Text(AppStrings.noTvFound),
            ),
          ),
        );
      },
    );
  }
}
