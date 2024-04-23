import '../../../../../lib_imports.dart';
import '../../bloc/tv/popular/get_tv_popular_cubit.dart';

class PopularBlocConsumer extends StatelessWidget {
  const PopularBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var allTvs = context.read<GetTvPopularCubit>().tvs;
    return BlocConsumer<GetTvPopularCubit, GetTvPopularState>(
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
            paginationLoading: () => PopularTv(tv: allTvs),
            loaded: (tvs) {
              return PopularTv(tv: allTvs);
            },
            error: (error) => Center(
                  child: Text(error),
                ));
      },
    );
  }
}
