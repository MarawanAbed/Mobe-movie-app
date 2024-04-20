import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_tv_by_genre.dart';

part 'get_tv_by_genre_state.dart';
part 'get_tv_by_genre_cubit.freezed.dart';

class GetTvByGenreCubit extends Cubit<GetTvByGenreState> {
  GetTvByGenreCubit(this._getTvByGenre) : super(const GetTvByGenreState.initial());

  final GetTvByGenre _getTvByGenre;

  void getTvByGenre(int genreId) async {
    emit(const GetTvByGenreState.loading());
    final result = await _getTvByGenre(genreId);
    result.when(
      success: (tv) {
        emit(GetTvByGenreState.loaded(tv));
      },
      failure: (message) {
        emit(GetTvByGenreState.error(message.toString()));
      },
    );
  }
}
