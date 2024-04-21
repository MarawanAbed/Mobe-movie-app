import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/lib_imports.dart';

class GetTvVideos extends UseCase<Future<ApiResult<String>>, int> {
  final TvRepo repository;

  GetTvVideos(this.repository);

  @override
  Future<ApiResult<String>> call([int? parameter]) async{
    return await repository.getTvVideos(parameter!);
  }
}