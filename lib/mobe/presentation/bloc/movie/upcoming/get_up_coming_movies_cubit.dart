import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/movie/movie_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/get_upcoming_movies.dart';

part 'get_up_coming_movies_state.dart';
part 'get_up_coming_movies_cubit.freezed.dart';

class GetUpComingMoviesCubit extends Cubit<GetUpComingMoviesState> {
  GetUpComingMoviesCubit(this._getUpComingMovies) : super(const GetUpComingMoviesState.initial());

  final GetUpComingMovies _getUpComingMovies;
  int _nextPage = 1;

  List<MovieModel>allMovies = [];
  void getUpComingMovies() async {
    if(_nextPage == 1)
    {
      emit(const GetUpComingMoviesState.loading());
    }else
    {
      emit(const GetUpComingMoviesState.paginationLoading());
    }
    final result = await _getUpComingMovies(_nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(GetUpComingMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetUpComingMoviesState.error(error.toString()));
      },
    );
  }
}
