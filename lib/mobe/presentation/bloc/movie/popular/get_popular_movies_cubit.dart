import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/movie/movie_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/get_popular_movies.dart';

part 'get_popular_movies_state.dart';
part 'get_popular_movies_cubit.freezed.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this._getPopularMovies) : super(const GetPopularMoviesState.initial());

  final GetPopularMovies _getPopularMovies;

  int _nextPage = 1;
  List<MovieModel>allMovies = [];

  void getPopularMovies() async {
    if(_nextPage == 1)
    {
      emit(const GetPopularMoviesState.loading());
    }else
    {
      emit(const GetPopularMoviesState.paginationLoading());
    }
    final result = await _getPopularMovies(_nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(GetPopularMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetPopularMoviesState.error(error.toString()));
      },
    );
  }
}
