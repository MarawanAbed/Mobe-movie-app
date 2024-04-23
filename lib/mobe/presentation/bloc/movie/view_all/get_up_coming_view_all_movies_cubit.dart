import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../lib_imports.dart';

part 'get_up_coming_view_all_movies_state.dart';
part 'get_up_coming_view_all_movies_cubit.freezed.dart';

class GetUpComingViewAllMoviesCubit extends Cubit<GetUpComingViewAllMoviesState> {
  GetUpComingViewAllMoviesCubit(this._getUpComingMovies) : super(const GetUpComingViewAllMoviesState.initial());

  final GetUpComingMovies _getUpComingMovies ;

  int _nextPage = 1;

  List<MovieModel>viewAllMovies = [];

  void getUpComingMoviesViewAll() async {
    if(_nextPage == 1)
    {
      emit(const GetUpComingViewAllMoviesState.loading());
    }else
    {
      emit(const GetUpComingViewAllMoviesState.paginationLoading());
    }
    final result = await _getUpComingMovies(_nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(GetUpComingViewAllMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(GetUpComingViewAllMoviesState.error(error.toString()));
      },
    );
  }
}
