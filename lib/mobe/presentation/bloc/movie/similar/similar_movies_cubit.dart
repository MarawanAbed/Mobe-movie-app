import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/movie/movie_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/get_similar_movie.dart';

part 'similar_movies_state.dart';
part 'similar_movies_cubit.freezed.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit(this._getSimilarMovies) : super(const SimilarMoviesState.initial());

  final GetSimilarMovies _getSimilarMovies;


  int _nextPage = 1;

  void getSimilarMovies(int id) async {
    if(_nextPage==1){
      emit(const SimilarMoviesState.loading());
    }else
    {
      emit(const SimilarMoviesState.paginationLoading());
    }
    final result = await _getSimilarMovies(id, _nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(SimilarMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(SimilarMoviesState.error(error.toString()));
      },
    );
  }
}
