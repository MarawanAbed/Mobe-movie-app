import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetSimilarMovies extends UseCase<Future<ApiResult<List<MovieModel>>>,int>
{
  final MovieRepo _repo;

  GetSimilarMovies(this._repo);
  @override
  Future<ApiResult<List<MovieModel>>> call([int? parameter])async {
    return await _repo.getSimilarMovie(parameter!);
  }

}