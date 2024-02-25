import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/search/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search Page'),
        ),
        body: const SearchBody(),
      ),
    );
  }
}
