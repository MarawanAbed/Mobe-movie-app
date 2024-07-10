import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class SearchMovie extends UseCaseTwo<Future<ApiResult<List<MovieModel>>>, String,int> {
  final MovieRepo _repo;

  SearchMovie(this._repo);

  @override
  Future<ApiResult<List<MovieModel>>> call([String? parameterOne,int? parameterTwo]) async {
    return await _repo.searchMovie(parameterOne!,parameterTwo!);
  }
}
