import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetMovieByGenre extends UseCase<Future<ApiResult<List<MovieModel>>>, int> {
  final Repo _repo;

  GetMovieByGenre(this._repo);

  @override
  Future<ApiResult<List<MovieModel>>> call([int? parameter]) async {
    return await _repo.getMoviesByGenre(parameter!);
  }
}
