import 'package:movie_app/mobe/presentation/widgets/type/type_movie_bloc_builder.dart';
import 'package:movie_app/mobe/presentation/widgets/type/type_tv_bloc_builder.dart';

import '../../../../../lib_imports.dart';

class TypeBody extends StatelessWidget {
  const TypeBody({super.key, required this.isMovie, required this.id});

  final bool isMovie;
  final int id;
  @override
  Widget build(BuildContext context) {
    return isMovie
        ? TypeMovieBlocBuilder( id: id)
        : TypeTvBlocBuilder(id: id);
  }
}
