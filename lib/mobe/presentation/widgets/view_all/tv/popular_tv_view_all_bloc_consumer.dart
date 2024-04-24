import 'package:movie_app/mobe/presentation/bloc/tv/view_all/get_tv_popular_view_all_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/tv/popular_tv_view_all_body.dart';

import '../../../../../lib_imports.dart';

class PopularTvViewAllBlocConsumer extends StatelessWidget {
  const PopularTvViewAllBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetTvPopularViewAllCubit>().tvs;
    return BlocConsumer<GetTvPopularViewAllCubit,
        GetTvPopularViewAllState>(
      buildWhen: (previous, current) =>
      current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tv) {
            cubit.addAll(tv);
          },
        );
      },
      builder: (context, state) {
        return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            paginationLoading: ()=> PopularTvViewAllBody(
              tvs: cubit,
            ),
            loaded: (tv) {
              return PopularTvViewAllBody(
                tvs: cubit,
              );
            },
            error: (error) => Center(
              child: Text(error),
            )
        );
      },
    );
  }
}
