import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/app_text_form.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/search/search_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/search_tv/search_bloc_builder.dart';

class SearchTvBody extends StatelessWidget {
  const SearchTvBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchTvCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Search',
            onChanged: (value) {
              cubit.searchTv(value);
            },
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SearchTvBlocBuilder(),
        ],
      ),
    );
  }
}
