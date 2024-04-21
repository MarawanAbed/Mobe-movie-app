import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../lib_imports.dart';

part 'get_tv_by_genre_cubit.freezed.dart';
part 'get_tv_by_genre_state.dart';

class GetTvByGenreCubit extends Cubit<GetTvByGenreState> {
  GetTvByGenreCubit(this._getTvByGenre)
      : super(const GetTvByGenreState.initial());

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
