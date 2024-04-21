import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../lib_imports.dart';

part 'get_airing_today_cubit.freezed.dart';
part 'get_airing_today_state.dart';

class GetAiringTodayCubit extends Cubit<GetAiringTodayState> {
  GetAiringTodayCubit(this._getAiringTodayTv)
      : super(const GetAiringTodayState.initial());

  final GetAiringTodayTv _getAiringTodayTv;

  void getAiringToday() async {
    emit(const GetAiringTodayState.loading());
    final result = await _getAiringTodayTv.call();
    result.when(
      success: (tv) {
        emit(GetAiringTodayState.loaded(tv));
      },
      failure: (error) {
        emit(GetAiringTodayState.error(error.toString()));
      },
    );
  }
}


