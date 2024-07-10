import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/mobe/presentation/widgets/search_tv/build_search_tvs.dart';

import '../../bloc/tv/search/search_tv_cubit.dart';


class SearchTvBlocBuilder extends StatelessWidget {
  const SearchTvBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTvCubit, SearchTvState>(
      builder: (context, state) {
        return state.when(
          paginationLoading: () => const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          initial: () => const Expanded(
            child: Center(
              child: Text(AppStrings.searchTv),
            ),
          ),
          loaded: (tv) {
            return  Expanded(
                    child: BuildSearchTv(
                      tv: tv,
                    ),
                  );
          },
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
