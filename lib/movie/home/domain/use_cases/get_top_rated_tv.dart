import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetTopRatedTv extends UseCase<Future<ApiResult<List<TvModel>>>,NoParameter>
{
  final Repo _repo;

  GetTopRatedTv(this._repo);
  @override
  Future<ApiResult<List<TvModel>>> call([NoParameter? parameter])async {
    return await _repo.getTopRatedTv();
  }

}