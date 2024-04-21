import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';

class GetMovieGenres extends UseCase<Future<ApiResult<List<GenresModel>>>, NoParameter> {
  final MovieRepo _repository;

  GetMovieGenres(this._repository);

  @override
  Future<ApiResult<List<GenresModel>>> call([NoParameter? parameter]) async {
    return await _repository.getMovieGenres();
  }
}