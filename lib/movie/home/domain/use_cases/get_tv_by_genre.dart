import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetTvByGenre extends UseCase<Future<ApiResult<List<TvModel>>>, int> {
  final Repo _repo;

  GetTvByGenre(this._repo);

  @override
  Future<ApiResult<List<TvModel>>> call([int? parameter]) async {
    return await _repo.getTvByGenre(parameter!);
  }
}
