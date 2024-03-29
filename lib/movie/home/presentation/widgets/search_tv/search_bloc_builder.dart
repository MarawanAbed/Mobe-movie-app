import 'package:movie_app/lib_imports.dart';
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
              child: Text(AppStrings.searchTv),
            ),
          ),
          loaded: (tv) {
            return tv.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(AppStrings.noTvFound),
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
              child: Text(AppStrings.noTvFound),
            ),
          ),
        );
      },
    );
  }
}
