import '../../../../../lib_imports.dart';
import 'movie_details_bloc_builder.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return MovieDetailsBlocBuilder(
      id: id,
    );
  }
}
