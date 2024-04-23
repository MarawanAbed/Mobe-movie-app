import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetMovieByGenre extends UseCaseTwo<Future<ApiResult<List<MovieModel>>>, int,int> {
  final MovieRepo _repo;

  GetMovieByGenre(this._repo);

  @override
  Future<ApiResult<List<MovieModel>>> call([int? parameterOne,int?parameterTwo ]) async {
    return await _repo.getMoviesByGenre(parameterOne!,parameterTwo!);
  }
}
