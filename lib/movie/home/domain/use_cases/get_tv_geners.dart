import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';

class GetTvGenres extends UseCase<Future<ApiResult<List<GenresModel>>>, NoParameter> {
  final Repo _repository;

  GetTvGenres(this._repository);

  @override
  Future<ApiResult<List<GenresModel>>> call([NoParameter? parameter]) async {
    return await _repository.getTvGenres();
  }
}