import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_popular_tv.dart';

part 'get_tv_popular_state.dart';
part 'get_tv_popular_cubit.freezed.dart';

class GetTvPopularCubit extends Cubit<GetTvPopularState> {
  GetTvPopularCubit(this._getPopularTv) : super(const GetTvPopularState.initial());

  final GetPopularTv _getPopularTv;


  void getPopularTv() async {
    emit(const GetTvPopularState.loading());
    final result = await _getPopularTv();
    result.when(
      success: (tv) {
        emit(GetTvPopularState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvPopularState.error(error.toString()));
      },
    );
  }
}
