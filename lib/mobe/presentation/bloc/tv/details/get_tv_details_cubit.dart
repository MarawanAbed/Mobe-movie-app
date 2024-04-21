import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/tv/tv_details_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/get_tv_details.dart';

part 'get_tv_details_state.dart';
part 'get_tv_details_cubit.freezed.dart';

class GetTvDetailsCubit extends Cubit<GetTvDetailsState> {
  GetTvDetailsCubit(this._getTvDetails) : super(const GetTvDetailsState.initial());

  final GetTvDetails _getTvDetails;


  void getTvDetails(int id) async {
    emit(const GetTvDetailsState.loading());
    final result = await _getTvDetails(id);
    result.when(
      success: (tv) {
        emit(GetTvDetailsState.loaded(tv));
      },
      failure: (error) {
        emit(GetTvDetailsState.error(error.toString()));
      },
    );
  }
}
