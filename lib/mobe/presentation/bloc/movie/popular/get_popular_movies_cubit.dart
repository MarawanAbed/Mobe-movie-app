import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/movie/movie_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/get_popular_movies.dart';

part 'get_popular_movies_state.dart';
part 'get_popular_movies_cubit.freezed.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this._getPopularMovies) : super(const GetPopularMoviesState.initial());

  final GetPopularMovies _getPopularMovies;

  void getPopularMovies() async {
    emit(const GetPopularMoviesState.loading());
    final result = await _getPopularMovies();
    result.when(
      success: (movies) {
        emit(GetPopularMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetPopularMoviesState.error(error.toString()));
      },
    );
  }
}
