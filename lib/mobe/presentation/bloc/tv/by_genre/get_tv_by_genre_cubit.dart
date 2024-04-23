import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../lib_imports.dart';

part 'get_tv_by_genre_cubit.freezed.dart';
part 'get_tv_by_genre_state.dart';

class GetTvByGenreCubit extends Cubit<GetTvByGenreState> {
  GetTvByGenreCubit(this._getTvByGenre)
      : super(const GetTvByGenreState.initial());

  final GetTvByGenre _getTvByGenre;

  int _nextPage=1;
  void getTvByGenre(int genreId) async {
    if(_nextPage==1)
    {
      emit(const GetTvByGenreState.loading());
    }else
    {
      emit(const GetTvByGenreState.paginationLoading());
    }
    final result = await _getTvByGenre(genreId, _nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(GetTvByGenreState.loaded(tv));
      },
      failure: (message) {
        emit(GetTvByGenreState.error(message.toString()));
      },
    );
  }
}
