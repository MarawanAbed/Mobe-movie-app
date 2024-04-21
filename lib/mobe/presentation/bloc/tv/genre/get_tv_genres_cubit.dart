import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/genres/genres_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/get_tv_geners.dart';

part 'get_tv_genres_state.dart';
part 'get_tv_genres_cubit.freezed.dart';

class GetTvGenresCubit extends Cubit<GetTvGenresState> {
  GetTvGenresCubit(this._getTvGenres) : super(const GetTvGenresState.initial());

  final GetTvGenres _getTvGenres;

  void getTvGenres() async {
    emit(const GetTvGenresState.loading());
    final result = await _getTvGenres();
    result.when(
      success: (genres) {
        emit(GetTvGenresState.loaded(genres));
      },
      failure: (error) {
        emit(GetTvGenresState.error(error.toString()));
      },
    );
  }
}
