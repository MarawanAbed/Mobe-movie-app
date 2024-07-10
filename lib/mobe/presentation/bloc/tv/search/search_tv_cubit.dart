import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/tv/tv_model.dart';
import 'package:movie_app/mobe/domain/use_cases/tv/search_tv.dart';

part 'search_tv_state.dart';
part 'search_tv_cubit.freezed.dart';

class SearchTvCubit extends Cubit<SearchTvState> {
  SearchTvCubit(this._searchTv) : super(const SearchTvState.initial());

  final SearchTv _searchTv;

  final List<TvModel> tv = [];
  int _nextPage=1;

  void searchTv(String query) async {
    if(_nextPage==1)
    {
      null;
    }else
    {
      emit(const SearchTvState.paginationLoading());
    }
    final result = await _searchTv(query,_nextPage);
    result.when(
      success: (tv) {
        this.tv.clear();
        this.tv.addAll(tv);
        emit(SearchTvState.loaded(tv));
      },
      failure: (error) {
        emit(SearchTvState.error(error.toString()));
      },
    );
  }

  void clear()
  {
    tv.clear();
    emit(const SearchTvState.initial());
  }
}
