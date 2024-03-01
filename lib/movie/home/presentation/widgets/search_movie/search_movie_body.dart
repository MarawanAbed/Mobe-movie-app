import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/core/widgets/app_text_form.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/search/search_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/search_movie/search_bloc_builder.dart';

class SearchMovieBody extends StatelessWidget {
  const SearchMovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchMoviesCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          AppTextFormField(
            hintText: AppStrings.search,
            onChanged: (value) {
              cubit.searchMovies(value);
            },
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SearchBlocBuilder(),
        ],
      ),
    );
  }
}
