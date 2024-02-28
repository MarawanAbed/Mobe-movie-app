
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/usecases/use_cases.dart';
import 'package:movie_app/movie/home/data/models/movie_details_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class GetMovieDetails extends UseCase<Future<ApiResult<MovieDetailsModel>>,int>
{
  final Repo _repo;

  GetMovieDetails(this._repo);
  @override
  Future<ApiResult<MovieDetailsModel>> call([int? parameter])async {
   return await _repo.getMovieDetail(parameter!);
  }
}