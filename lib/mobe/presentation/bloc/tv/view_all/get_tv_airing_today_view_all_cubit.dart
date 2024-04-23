import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/lib_imports.dart';

part 'get_tv_airing_today_view_all_cubit.freezed.dart';
part 'get_tv_airing_today_view_all_state.dart';

class GetTvAiringTodayViewAllCubit extends Cubit<GetTvAiringTodayViewAllState> {
  GetTvAiringTodayViewAllCubit(this._getTvAiringToday)
      : super(const GetTvAiringTodayViewAllState.initial());

  final GetAiringTodayTv _getTvAiringToday;

  List<TvModel> tvs = [];

  int _nextPage = 1;

  void getTvAiringTodayViewAll() async {
    if (_nextPage == 1) {
      emit(const GetTvAiringTodayViewAllState.loading());
    } else {
      emit(const GetTvAiringTodayViewAllState.paginationLoading());
    }
    final result = await _getTvAiringToday(_nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(GetTvAiringTodayViewAllState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvAiringTodayViewAllState.error(error.toString()));
      },
    );
  }
}
