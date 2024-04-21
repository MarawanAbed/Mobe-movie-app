import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/mobe/data/models/genres/genres_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/get_movie_geners.dart';



part 'get_movie_genres_cubit.freezed.dart';

part 'get_movie_genres_state.dart';

class GetMovieGenresCubit extends Cubit<GetMovieGenresState> {
  GetMovieGenresCubit(this._getMovieGenres)
      : super(const GetMovieGenresState.initial());

  final GetMovieGenres _getMovieGenres;

  void getMovieGenres() async {
    emit(const GetMovieGenresState.loading());
    final result = await _getMovieGenres();
    result.when(
      success: (genres) {
        emit(GetMovieGenresState.loaded(genres));
      },
      failure: (ErrorHandler errorHandler) {
        emit(GetMovieGenresState.error(errorHandler.toString()));
      },
    );
  }
}
