import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_similar_movie.dart';

part 'similar_movies_state.dart';
part 'similar_movies_cubit.freezed.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit(this._getSimilarMovies) : super(const SimilarMoviesState.initial());

  final GetSimilarMovies _getSimilarMovies;


  void getSimilarMovies(int id) async {
    emit(const SimilarMoviesState.loading());
    final result = await _getSimilarMovies(id);
    result.when(
      success: (movies) {
        emit(SimilarMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(SimilarMoviesState.error(error.toString()));
      },
    );
  }
}
