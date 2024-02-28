import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_top_rated_movies.dart';

part 'get_top_rated_movies_state.dart';
part 'get_top_rated_movies_cubit.freezed.dart';

class GetTopRatedMoviesCubit extends Cubit<GetTopRatedMoviesState> {
  GetTopRatedMoviesCubit(this._getTopRatedMovies) : super(const GetTopRatedMoviesState.initial());
  final GetTopRatedMovies _getTopRatedMovies;

  void getTopRatedMovies() async {
    emit(const GetTopRatedMoviesState.loading());
    final result = await _getTopRatedMovies();
    result.when(
      success: (movies) {
        emit(GetTopRatedMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetTopRatedMoviesState.error(error.toString()));
      },
    );
  }
}
