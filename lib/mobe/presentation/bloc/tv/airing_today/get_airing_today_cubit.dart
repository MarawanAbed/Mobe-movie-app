import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../lib_imports.dart';

part 'get_airing_today_cubit.freezed.dart';
part 'get_airing_today_state.dart';

class GetAiringTodayCubit extends Cubit<GetAiringTodayState> {
  GetAiringTodayCubit(this._getAiringTodayTv)
      : super(const GetAiringTodayState.initial());

  final GetAiringTodayTv _getAiringTodayTv;

  int _nextPage = 1;

  List<TvModel>tvs=[];

  void getAiringToday() async {
    if(_nextPage==1)
    {
      emit(const GetAiringTodayState.loading());
    }else
    {
      emit(const GetAiringTodayState.paginationLoading());
    }
    final result = await _getAiringTodayTv.call(_nextPage);
    result.when(
      success: (tv) {
        _nextPage++;
        emit(GetAiringTodayState.loaded(tv));
      },
      failure: (error) {
        emit(GetAiringTodayState.error(error.toString()));
      },
    );
  }
}


