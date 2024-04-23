import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../lib_imports.dart';

part 'get_top_rated_view_all_movies_cubit.freezed.dart';
part 'get_top_rated_view_all_movies_state.dart';

class GetTopRatedViewAllMoviesCubit
    extends Cubit<GetTopRatedViewAllMoviesState> {
  GetTopRatedViewAllMoviesCubit(this._getTopRatedMovies)
      : super(const GetTopRatedViewAllMoviesState.initial());

  final GetTopRatedMovies _getTopRatedMovies;

  int _nextPage = 1;
  List<MovieModel> allMovies = [];

  void getTopRatedMoviesViewAll() async {
    if (_nextPage == 1) {
      emit(const GetTopRatedViewAllMoviesState.loading());
    } else {
      emit(const GetTopRatedViewAllMoviesState.paginationLoading());
    }
    final result = await _getTopRatedMovies(_nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(GetTopRatedViewAllMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetTopRatedViewAllMoviesState.error(error.toString()));
      },
    );
  }
}
