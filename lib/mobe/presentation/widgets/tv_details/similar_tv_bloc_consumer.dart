import 'package:movie_app/mobe/presentation/bloc/tv/similar/similar_tv_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/tv_details/similar_list_view.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/widgets/no_data.dart';

class SimilarTvBlocConsumer extends StatefulWidget {
  const SimilarTvBlocConsumer({super.key, required this.id});

  final int id;

  @override
  State<SimilarTvBlocConsumer> createState() => _SimilarTvBlocConsumerState();
}

class _SimilarTvBlocConsumerState extends State<SimilarTvBlocConsumer> {
  @override
  void initState() {
    context.read<SimilarTvCubit>().getSimilarTv(widget.id);
    super.initState();
  }

  List<TvModel>tvs=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarTvCubit, SimilarTvState>(
      buildWhen: (previous, current) =>
      current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tv) {
            tvs.addAll(tv);
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          paginationLoading: ()=> SimilarTvListView(tvs: tvs, id: widget.id),
          loaded: (tv) {
            return SimilarTvListView(tvs: tvs, id: widget.id);
          },
          error: (error) => const NoDataWidget(),
        );
      },
    );
  }
}
