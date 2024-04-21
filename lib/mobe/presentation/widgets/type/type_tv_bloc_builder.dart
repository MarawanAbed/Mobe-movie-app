

import '../../../../../lib_imports.dart';
import '../../bloc/tv/by_genre/get_tv_by_genre_cubit.dart';
import 'build_type.dart';

class TypeTvBlocBuilder extends StatefulWidget {
  const TypeTvBlocBuilder({super.key, required this.isMovie, required this.id});
  final bool isMovie;
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvByGenreCubit, GetTvByGenreState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tv)=>BuildType(isMovie: widget.isMovie,tv: tv,),
          error: (message) => Text(message),
        );
      },
    );
  }
}
