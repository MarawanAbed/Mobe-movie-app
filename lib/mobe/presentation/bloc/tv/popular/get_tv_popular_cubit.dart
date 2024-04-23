import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/tv/tv_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/get_popular_tv.dart';

part 'get_tv_popular_state.dart';
part 'get_tv_popular_cubit.freezed.dart';

class GetTvPopularCubit extends Cubit<GetTvPopularState> {
  GetTvPopularCubit(this._getPopularTv) : super(const GetTvPopularState.initial());

  final GetPopularTv _getPopularTv;

  List<TvModel>tvs=[];

  int _nextPage = 1;
  void getPopularTv() async {
    if(_nextPage==1)
      {
        emit(const GetTvPopularState.loading());
      }else
      {
        emit(const GetTvPopularState.paginationLoading());
      }
    final result = await _getPopularTv(_nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(GetTvPopularState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvPopularState.error(error.toString()));
      },
    );
  }
}
