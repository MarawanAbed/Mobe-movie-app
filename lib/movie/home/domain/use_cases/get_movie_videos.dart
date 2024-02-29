import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetMovieVideos extends UseCase<Future<ApiResult<String>>, int> {
  final Repo repository;

  GetMovieVideos(this.repository);

  @override
  Future<ApiResult<String>> call([int? parameter]) async{
    return await repository.getMovieVideos(parameter!);
  }
}