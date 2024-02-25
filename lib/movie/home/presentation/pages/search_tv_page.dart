import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/search_tv/search_tv_body.dart';

class SearchTvPage extends StatelessWidget {
  const SearchTvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search Tv'),
        ),
        body: const SearchTvBody(),
      ),
    );
  }
}
