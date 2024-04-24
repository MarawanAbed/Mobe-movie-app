import 'package:movie_app/mobe/presentation/bloc/tv/view_all/get_tv_top_rated_view_all_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/tv/top_rated_tv_view_all_body.dart';

import '../../../../../lib_imports.dart';


class TopRatedTvViewAllBlocConsumer extends StatelessWidget {
  const TopRatedTvViewAllBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetTvTopRatedViewAllCubit>();
    return BlocConsumer<GetTvTopRatedViewAllCubit,
        GetTvTopRatedViewAllState>(
      buildWhen: (previous, current) =>
      current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tv) {
            cubit.viewTvAll.addAll(tv);
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          paginationLoading: ()=> TopRatedTvViewAllBody(
            tvs:  cubit.viewTvAll,
          ),
          loaded: (movies) {
            return TopRatedTvViewAllBody(
              tvs:  cubit.viewTvAll,
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
