import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/movie/movie_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/get_top_rated_movies.dart';

part 'get_top_rated_movies_state.dart';
part 'get_top_rated_movies_cubit.freezed.dart';

class GetTopRatedMoviesCubit extends Cubit<GetTopRatedMoviesState> {
  GetTopRatedMoviesCubit(this._getTopRatedMovies) : super(const GetTopRatedMoviesState.initial());
  final GetTopRatedMovies _getTopRatedMovies;

  int _nextPage = 1;
  List<MovieModel>allMovies = [];

  void getTopRatedMovies() async {
    if(_nextPage == 1)
    {
      emit(const GetTopRatedMoviesState.loading());
    }else
    {
      emit(const GetTopRatedMoviesState.paginationLoading());
    }
    final result = await _getTopRatedMovies(_nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(GetTopRatedMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetTopRatedMoviesState.error(error.toString()));
      },
    );
  }
}
