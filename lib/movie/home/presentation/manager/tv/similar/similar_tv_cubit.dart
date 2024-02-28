import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_similar_tv.dart';

part 'similar_tv_state.dart';
part 'similar_tv_cubit.freezed.dart';

class SimilarTvCubit extends Cubit<SimilarTvState> {
  SimilarTvCubit(this._getSimilarTv) : super(const SimilarTvState.initial());

  final GetSimilarTv _getSimilarTv;


  void getSimilarTv(int id) async {
    emit(const SimilarTvState.loading());
    final result = await _getSimilarTv(id);
    result.when(
      success: (tv) {
        emit(SimilarTvState.loaded(tv));
      },
      failure: (error) {
        emit(SimilarTvState.error(error.toString()));
      },
    );
  }
}
