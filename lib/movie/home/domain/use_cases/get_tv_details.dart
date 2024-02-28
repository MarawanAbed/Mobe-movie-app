import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/tv_details_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetTvDetails extends UseCase<Future<ApiResult<TvDetailsModel>>, int> {
  final Repo _repo;

  GetTvDetails(this._repo);

  @override
  Future<ApiResult<TvDetailsModel>> call([int? parameter]) async {
    return await _repo.getTvDetail(parameter!);
  }
}
