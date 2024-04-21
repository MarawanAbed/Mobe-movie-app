import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class SearchTv extends UseCase<Future<ApiResult<List<TvModel>>>,String>
{
  final TvRepo _repo;

  SearchTv(this._repo);
  @override
  Future<ApiResult<List<TvModel>>> call([String? parameter])async {
    return await _repo.searchTv(parameter!);
  }

}