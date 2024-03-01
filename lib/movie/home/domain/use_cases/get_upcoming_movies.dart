import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetUpComingMovies extends UseCase<Future<ApiResult<List<MovieModel>>>,NoParameter>
{
  final Repo _repo;

  GetUpComingMovies(this._repo);
  @override
  Future<ApiResult<List<MovieModel>>> call([NoParameter? parameter])async {
    return await _repo.getUpcomingMovies();
  }

}