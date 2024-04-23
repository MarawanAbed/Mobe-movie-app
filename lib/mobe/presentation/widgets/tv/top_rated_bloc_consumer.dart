import '../../../../../lib_imports.dart';
import '../../bloc/tv/top_rated/get_tv_top_rated_cubit.dart';

class TopRatedBlocConsumer extends StatelessWidget {
  const TopRatedBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var allTvs = context.read<GetTvTopRatedCubit>().tvs;
    return BlocConsumer<GetTvTopRatedCubit, GetTvTopRatedState>(
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
            paginationLoading: () => TopRatedTv(tv: allTvs),
            loaded: (tvs) {
              return TopRatedTv(tv: allTvs);
            },
            error: (error) => Center(
                  child: Text(error),
                ));
      },
    );
  }
}
