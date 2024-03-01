import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetSimilarTv extends UseCase<Future<ApiResult<List<TvModel>>>,int>
{
  final Repo _repo;

  GetSimilarTv(this._repo);
  @override
  Future<ApiResult<List<TvModel>>> call([int? parameter])async {
    return await _repo.getSimilarTv(parameter!);
  }

}