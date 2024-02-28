import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/movie/home/data/models/movie_details_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_movie_details.dart';

part 'get_movie_details_cubit.freezed.dart';

part 'get_movie_details_state.dart';

class GetMovieDetailsCubit extends Cubit<GetMovieDetailsState> {
  GetMovieDetailsCubit(this._getMovieDetails)
      : super(const GetMovieDetailsState.initial());

  final GetMovieDetails _getMovieDetails;

  void getMovieDetails(int id) async {
    emit(const GetMovieDetailsState.loading());
    final result = await _getMovieDetails(id);
    result.when(
      success: (movieDetails) {
        emit(GetMovieDetailsState.loaded(movieDetails));
      },
      failure: (ErrorHandler errorHandler) {
        emit(GetMovieDetailsState.error(errorHandler.toString()));
      },
    );
  }
}
