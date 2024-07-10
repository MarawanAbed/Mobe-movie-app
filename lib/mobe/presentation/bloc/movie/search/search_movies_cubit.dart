import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/mobe/data/models/movie/movie_model.dart';
import 'package:movie_app/mobe/domain/use_cases/movie/search_movies.dart';

part 'search_movies_state.dart';
part 'search_movies_cubit.freezed.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit(this._searchMovie) : super(const SearchMoviesState.initial());

  final SearchMovie _searchMovie;
  final List<MovieModel> movies = [];
  int _nextPage=1;
  String query='';
  void searchMovies(String query) async {
    if (_nextPage == 1) {
      null;
    } else {
      emit( const SearchMoviesState.paginationLoading());
    }
    final result = await _searchMovie(query,_nextPage);
    result.when(
      success: (newMovies) {
        movies.addAll(newMovies);
        _nextPage++;
        emit(SearchMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(SearchMoviesState.error(error.toString()));
      },
    );
  }

  void clear() {
    _nextPage = 1;
    movies.clear();
    emit(const SearchMoviesState.initial());
  }
}