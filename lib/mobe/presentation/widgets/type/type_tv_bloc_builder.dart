import 'package:movie_app/mobe/presentation/widgets/type/tv_grid_view.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/tv/by_genre/get_tv_by_genre_cubit.dart';

class TypeTvBlocBuilder extends StatefulWidget {
  const TypeTvBlocBuilder({super.key, required this.id});

  final int id;

  @override
  State<TypeTvBlocBuilder> createState() => _TypeTvBlocBuilderState();
}

class _TypeTvBlocBuilderState extends State<TypeTvBlocBuilder> {
  @override
  void initState() {
    context.read<GetTvByGenreCubit>().getTvByGenre(widget.id);
    super.initState();
  }

  List<TvModel> tvs = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTvByGenreCubit, GetTvByGenreState>(
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
          paginationLoading: () => TypeTvGridView(
            id: widget.id,
            tvs: tvs,
          ),
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) => TypeTvGridView(
            id: widget.id,
            tvs: tvs,
          ),
          error: (message) => Text(message),
        );
      },
    );
  }
}
