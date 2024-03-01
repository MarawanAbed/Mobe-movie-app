import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';

class GetTvDetails extends UseCase<Future<ApiResult<TvDetailsModel>>, int> {
  final Repo _repo;

  GetTvDetails(this._repo);

  @override
  Future<ApiResult<TvDetailsModel>> call([int? parameter]) async {
    return await _repo.getTvDetail(parameter!);
  }
}
