import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_airing_today_tv.dart';

part 'get_airing_today_state.dart';
part 'get_airing_today_cubit.freezed.dart';

class GetAiringTodayCubit extends Cubit<GetAiringTodayState> {
  GetAiringTodayCubit(this._getAiringTodayTv) : super(const GetAiringTodayState.initial());

  final GetAiringTodayTv _getAiringTodayTv;


  void getAiringToday() async {
    emit(const GetAiringTodayState.loading());
    final result = await _getAiringTodayTv();
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
