
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetAiringTodayTv extends UseCase<Future<ApiResult<List<TvModel>>>,NoParameter>
{
  final Repo _repo;

  GetAiringTodayTv(this._repo);
  @override
  Future<ApiResult<List<TvModel>>> call([NoParameter? parameter])async {
    return await _repo.getAiringTodayTv();
  }

}