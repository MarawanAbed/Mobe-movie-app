
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetPopularMovies extends UseCase<Future<ApiResult<List<MovieModel>>>,NoParameter>
{
  final Repo _repo;

  GetPopularMovies(this._repo);
  @override
  Future<ApiResult<List<MovieModel>>> call([NoParameter? parameter])async {
    return await _repo.getPopularMovies();
  }

}