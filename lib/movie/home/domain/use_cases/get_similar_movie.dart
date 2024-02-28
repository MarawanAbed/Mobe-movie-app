
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetSimilarMovies extends UseCase<Future<ApiResult<List<MovieModel>>>,int>
{
  final Repo _repo;

  GetSimilarMovies(this._repo);
  @override
  Future<ApiResult<List<MovieModel>>> call([int? parameter])async {
    return await _repo.getSimilarMovie(parameter!);
  }

}