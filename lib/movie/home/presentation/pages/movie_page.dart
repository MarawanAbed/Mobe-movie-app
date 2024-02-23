import 'package:flutter/material.dart';

import '../widgets/movie_body.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: MovieBody(),
        ),
      ),
    );
  }
}


