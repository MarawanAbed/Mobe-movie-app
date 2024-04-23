import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';

class GetPopularMovies extends UseCase<Future<ApiResult<List<MovieModel>>>,int>
{
  final MovieRepo _repo;

  GetPopularMovies(this._repo);
  @override
  Future<ApiResult<List<MovieModel>>> call([int? parameter])async {
    return await _repo.getPopularMovies(parameter!);
  }

}