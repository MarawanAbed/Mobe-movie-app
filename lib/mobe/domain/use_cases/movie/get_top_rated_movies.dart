import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetTopRatedMovies extends UseCase<Future<ApiResult<List<MovieModel>>>,int>
{
  final MovieRepo _repo;

  GetTopRatedMovies(this._repo);
  @override
  Future<ApiResult<List<MovieModel>>> call([int? parameter])async {
    return await _repo.getTopRatedMovies(parameter!);
  }

}