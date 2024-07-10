import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class SearchTv extends UseCaseTwo<Future<ApiResult<List<TvModel>>>,String,int>
{
  final TvRepo _repo;

  SearchTv(this._repo);
  @override
  Future<ApiResult<List<TvModel>>> call([String? parameterOne,int? parameterTwo])async {
    return await _repo.searchTv(parameterOne!,parameterTwo!);
  }

}