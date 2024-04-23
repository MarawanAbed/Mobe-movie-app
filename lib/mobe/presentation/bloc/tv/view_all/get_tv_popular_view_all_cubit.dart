import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../lib_imports.dart';

part 'get_tv_popular_view_all_state.dart';
part 'get_tv_popular_view_all_cubit.freezed.dart';

class GetTvPopularViewAllCubit extends Cubit<GetTvPopularViewAllState> {
  GetTvPopularViewAllCubit(this._getPopularTv) : super(const GetTvPopularViewAllState.initial());

  final GetPopularTv _getPopularTv;

  List<TvModel> tvs = [];

  int _nextPage = 1;

  void getTvPopularViewAll() async {
    if (_nextPage == 1) {
      emit(const GetTvPopularViewAllState.loading());
    } else {
      emit(const GetTvPopularViewAllState.paginationLoading());
    }
    final result = await _getPopularTv(_nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(GetTvPopularViewAllState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvPopularViewAllState.error(error.toString()));
      },
    );
  }
}
