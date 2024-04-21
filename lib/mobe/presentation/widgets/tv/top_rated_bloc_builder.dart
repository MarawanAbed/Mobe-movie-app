


import '../../../../../lib_imports.dart';
import '../../bloc/tv/top_rated/get_tv_top_rated_cubit.dart';

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
