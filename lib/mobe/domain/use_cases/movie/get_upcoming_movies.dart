import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetUpComingMovies extends UseCase<Future<ApiResult<List<MovieModel>>>,int>
{
  final MovieRepo _repo;

  GetUpComingMovies(this._repo);
  @override
  Future<ApiResult<List<MovieModel>>> call([int? parameter])async {
    return await _repo.getUpcomingMovies(parameter!);
  }

}