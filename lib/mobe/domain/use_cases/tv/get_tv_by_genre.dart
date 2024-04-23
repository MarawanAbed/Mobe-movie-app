import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetTvByGenre extends UseCaseTwo<Future<ApiResult<List<TvModel>>>, int,int> {
  final TvRepo _repo;

  GetTvByGenre(this._repo);

  @override
  Future<ApiResult<List<TvModel>>> call([int? parameterOne,int? parameterTwo]) async {
    return await _repo.getTvByGenre(parameterOne!,parameterTwo!);
  }
}
