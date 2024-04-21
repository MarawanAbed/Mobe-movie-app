import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/movie/movie_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/get_upcoming_movies.dart';

part 'get_up_coming_movies_state.dart';
part 'get_up_coming_movies_cubit.freezed.dart';

class GetUpComingMoviesCubit extends Cubit<GetUpComingMoviesState> {
  GetUpComingMoviesCubit(this._getUpComingMovies) : super(const GetUpComingMoviesState.initial());

  final GetUpComingMovies _getUpComingMovies;

  void getUpComingMovies() async {
    emit(const GetUpComingMoviesState.loading());
    final result = await _getUpComingMovies();
    result.when(
      success: (movies) {
        emit(GetUpComingMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetUpComingMoviesState.error(error.toString()));
      },
    );
  }
}
