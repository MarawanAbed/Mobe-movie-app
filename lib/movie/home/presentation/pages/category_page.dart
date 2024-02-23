import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/category_body.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: CategoryBody(),
        ),
      ),
    );
  }
}



