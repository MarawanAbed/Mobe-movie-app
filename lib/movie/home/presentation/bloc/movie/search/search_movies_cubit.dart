import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/search_movies.dart';

part 'search_movies_state.dart';
part 'search_movies_cubit.freezed.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit(this._searchMovie) : super(const SearchMoviesState.initial());

  final SearchMovie _searchMovie;
  final List<MovieModel> movies = [];
  void searchMovies(String query) async {
    final result = await _searchMovie(query);
    result.when(
      success: (movies) {
        this.movies.clear();
        this.movies.addAll(movies);
        emit(SearchMoviesState.loaded(movies));
      },
      failure: (error) {
        emit(SearchMoviesState.error(error.toString()));
      },
    );
  }
}
