import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class SearchMovie extends UseCase<Future<ApiResult<List<MovieModel>>>, String> {
  final Repo _repo;

  SearchMovie(this._repo);

  @override
  Future<ApiResult<List<MovieModel>>> call([String? parameter]) async {
    return await _repo.searchMovie(parameter!);
  }
}
