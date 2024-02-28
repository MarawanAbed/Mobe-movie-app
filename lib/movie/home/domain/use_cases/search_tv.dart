
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class SearchTv extends UseCase<Future<ApiResult<List<TvModel>>>,String>
{
  final Repo _repo;

  SearchTv(this._repo);
  @override
  Future<ApiResult<List<TvModel>>> call([String? parameter])async {
    return await _repo.searchTv(parameter!);
  }

}