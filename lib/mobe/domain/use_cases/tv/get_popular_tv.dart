import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';

class GetPopularTv extends UseCase<Future<ApiResult<List<TvModel>>>,int>
{
  final TvRepo _repo;

  GetPopularTv(this._repo);
  @override
  Future<ApiResult<List<TvModel>>> call([int? parameter])async {
    return await _repo.getPopularTv(parameter!);
  }

}