import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/genres_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetMovieGenres extends UseCase<Future<ApiResult<List<GenresModel>>>, NoParameter> {
  final Repo _repository;

  GetMovieGenres(this._repository);

  @override
  Future<ApiResult<List<GenresModel>>> call([NoParameter? parameter]) async {
    return await _repository.getMovieGenres();
  }
}