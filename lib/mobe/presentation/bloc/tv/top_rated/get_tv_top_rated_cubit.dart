import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/tv/tv_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/get_top_rated_tv.dart';

part 'get_tv_top_rated_state.dart';
part 'get_tv_top_rated_cubit.freezed.dart';

class GetTvTopRatedCubit extends Cubit<GetTvTopRatedState> {
  GetTvTopRatedCubit(this._getTopRatedTv) : super(const GetTvTopRatedState.initial());

  final GetTopRatedTv _getTopRatedTv;


  List<TvModel>tvs=[];
  int _nextPage = 1;
  void getTopRatedTv() async {
    if(_nextPage==1)
    {
      emit(const GetTvTopRatedState.loading());
    }else
    {
      emit(const GetTvTopRatedState.paginationLoading());
    }
    final result = await _getTopRatedTv(_nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(GetTvTopRatedState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvTopRatedState.error(error.toString()));
      },
    );
  }
}
