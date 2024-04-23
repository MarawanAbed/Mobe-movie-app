import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../lib_imports.dart';

part 'get_popular_view_all_movies_state.dart';
part 'get_popular_view_all_movies_cubit.freezed.dart';

class GetPopularViewAllMoviesCubit extends Cubit<GetPopularViewAllMoviesState> {
  GetPopularViewAllMoviesCubit(this._getPopularMovies) : super(const GetPopularViewAllMoviesState.initial());


  final GetPopularMovies _getPopularMovies;
  int _nextPage = 1;

  List<MovieModel>allMovies = [];
  void getPopularMoviesViewAll() async {
    if(_nextPage == 1)
    {
      emit(const GetPopularViewAllMoviesState.loading());
    }else
    {
      emit(const GetPopularViewAllMoviesState.paginationLoading());
    }
    final result = await _getPopularMovies(_nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(GetPopularViewAllMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetPopularViewAllMoviesState.error(error.toString()));
      },
    );
  }
}
