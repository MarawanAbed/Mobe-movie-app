import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/tv/tv_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/get_top_rated_tv.dart';

part 'get_tv_top_rated_state.dart';
part 'get_tv_top_rated_cubit.freezed.dart';

class GetTvTopRatedCubit extends Cubit<GetTvTopRatedState> {
  GetTvTopRatedCubit(this._getTopRatedTv) : super(const GetTvTopRatedState.initial());

  final GetTopRatedTv _getTopRatedTv;


  void getTopRatedTv() async {
    emit(const GetTvTopRatedState.loading());
    final result = await _getTopRatedTv();
    result.when(
      success: (tv) {
        emit(GetTvTopRatedState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvTopRatedState.error(error.toString()));
      },
    );
  }
}
