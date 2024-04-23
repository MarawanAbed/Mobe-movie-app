import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../lib_imports.dart';

part 'get_tv_top_rated_view_all_cubit.freezed.dart';
part 'get_tv_top_rated_view_all_state.dart';

class GetTvTopRatedViewAllCubit extends Cubit<GetTvTopRatedViewAllState> {
  GetTvTopRatedViewAllCubit(this._getTopRatedTv)
      : super(const GetTvTopRatedViewAllState.initial());

  final GetTopRatedTv _getTopRatedTv;

  List<TvModel> viewTvAll = [];

  int _nextPage = 1;

  void getTvTopRatedViewALl() async {
    if (_nextPage == 1) {
      emit(const GetTvTopRatedViewAllState.loading());
    } else {
      emit(const GetTvTopRatedViewAllState.paginationLoading());
    }
    final result = await _getTopRatedTv(_nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(GetTvTopRatedViewAllState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvTopRatedViewAllState.error(error.toString()));
      },
    );
  }
}
