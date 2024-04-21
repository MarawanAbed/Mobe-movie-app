import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';
class GetMovieVideos extends UseCase<Future<ApiResult<String>>, int> {
  final MovieRepo repository;

  GetMovieVideos(this.repository);

  @override
  Future<ApiResult<String>> call([int? parameter]) async{
    return await repository.getMovieVideos(parameter!);
  }
}