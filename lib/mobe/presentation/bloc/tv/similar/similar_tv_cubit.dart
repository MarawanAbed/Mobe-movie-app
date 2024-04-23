import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/tv/tv_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/get_similar_tv.dart';

part 'similar_tv_state.dart';
part 'similar_tv_cubit.freezed.dart';

class SimilarTvCubit extends Cubit<SimilarTvState> {
  SimilarTvCubit(this._getSimilarTv) : super(const SimilarTvState.initial());

  final GetSimilarTv _getSimilarTv;

  int _nextPage=1;

  void getSimilarTv(int id) async {
    if(_nextPage==1)
      {
        emit(const SimilarTvState.loading());
      }else
      {
        emit(const SimilarTvState.paginationLoading());
      }
    final result = await _getSimilarTv(id, _nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(SimilarTvState.loaded(tv));
      },
      failure: (error) {
        emit(SimilarTvState.error(error.toString()));
      },
    );
  }
}
