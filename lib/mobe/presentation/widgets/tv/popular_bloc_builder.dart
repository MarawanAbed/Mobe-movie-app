


import '../../../../../lib_imports.dart';
import '../../bloc/tv/popular/get_tv_popular_cubit.dart';

class PopularBlocBuilder extends StatelessWidget {
  const PopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvPopularCubit, GetTvPopularState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tv) {
            return PopularTv(
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
