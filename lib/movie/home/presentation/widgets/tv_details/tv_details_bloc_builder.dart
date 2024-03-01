import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/details/get_tv_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_details_items.dart';

class TvDetailsBlocBuilder extends StatefulWidget {
  const TvDetailsBlocBuilder({super.key, required this.id});

  final int id;

  @override
  State<TvDetailsBlocBuilder> createState() => _TvDetailsBlocBuilderState();
}

class _TvDetailsBlocBuilderState extends State<TvDetailsBlocBuilder> {
  @override
  void initState() {
    context.read<GetTvDetailsCubit>().getTvDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvDetailsCubit, GetTvDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tv) {
            return TvDetailsItems(
              tv: tv,
            );
          },
          error: (error) => const Center(child: Text(AppStrings.noDataFound)),
        );
      },
    );
  }
}
