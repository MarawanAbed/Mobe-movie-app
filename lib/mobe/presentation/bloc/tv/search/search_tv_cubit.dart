import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/tv/tv_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/search_tv.dart';

part 'search_tv_cubit.freezed.dart';
part 'search_tv_state.dart';

class SearchTvCubit extends Cubit<SearchTvState> {
  SearchTvCubit(this._searchTv) : super(const SearchTvState.initial());

  final SearchTv _searchTv;
  final List<TvModel> tvs = [];
  int _nextPage = 1;
  String query = '';

  void searchTv(String query) async {
    if (_nextPage == 1) {
      null;
    } else {
      emit( const SearchTvState.paginationLoading());
    }

    final result = await _searchTv(query, _nextPage);
    result.when(
      success: (newTvs) {
        tvs.addAll(newTvs);
        _nextPage++;
        emit(SearchTvState.loaded(tvs));
      },
      failure: (error) {
        emit(SearchTvState.error(error.toString()));
      },
    );
  }

  void clear() {
    _nextPage = 1;
    tvs.clear();
    emit(const SearchTvState.initial());
  }
}
