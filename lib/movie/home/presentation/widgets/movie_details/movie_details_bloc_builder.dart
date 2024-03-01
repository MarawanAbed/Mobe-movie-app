import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/details/get_movie_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/movies_details_items.dart';

class MovieDetailsBlocBuilder extends StatefulWidget {
  const MovieDetailsBlocBuilder({super.key, required this.id});

  final int id;

  @override
  State<MovieDetailsBlocBuilder> createState() =>
      _MovieDetailsBlocBuilderState();
}

class _MovieDetailsBlocBuilderState extends State<MovieDetailsBlocBuilder> {
  @override
  void initState() {
    context.read<GetMovieDetailsCubit>().getMovieDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieDetailsCubit, GetMovieDetailsState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (movie) {
              return MoviesDetailsItems(
                movies: movie,
              );
            },
            error: (error) => const Center(child: Text(AppStrings.noDataFound)));
      },
    );
  }
}
