import 'package:movie_app/mobe/presentation/bloc/tv/similar/similar_tv_cubit.dart';

import '../../../../../lib_imports.dart';

class SimilarTvBlocBuilder extends StatefulWidget {
  const SimilarTvBlocBuilder({super.key, required this.id});

  final int id;

  @override
  State<SimilarTvBlocBuilder> createState() => _SimilarTvBlocBuilderState();
}

class _SimilarTvBlocBuilderState extends State<SimilarTvBlocBuilder> {
  @override
  void initState() {
    context.read<SimilarTvCubit>().getSimilarTv(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarTvCubit, SimilarTvState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tv) {
            return BuildItemImages(
              tv: tv,
              screen: Routes.tvDetails,
            );
          },
          error: (error) => const Center(child: Text(AppStrings.noDataFound)),
        );
      },
    );
  }
}
