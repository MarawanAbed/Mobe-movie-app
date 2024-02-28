import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/search_tv.dart';

part 'search_tv_state.dart';
part 'search_tv_cubit.freezed.dart';

class SearchTvCubit extends Cubit<SearchTvState> {
  SearchTvCubit(this._searchTv) : super(const SearchTvState.initial());

  final SearchTv _searchTv;


  void searchTv(String query) async {
    emit(const SearchTvState.loading());
    final result = await _searchTv(query);
    result.when(
      success: (tv) {
        emit(SearchTvState.loaded(tv));
      },
      failure: (error) {
        emit(SearchTvState.error(error.toString()));
      },
    );
  }

}
