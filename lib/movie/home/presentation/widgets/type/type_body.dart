import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/image_items.dart';

class TypeBody extends StatelessWidget {
  const TypeBody({super.key, required this.isMovie});
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ImageItems(
        image: 'https://image.tmdb.org/t/p/w500/24CL0ySodCF8bcm38xtBeHzHp7W.jpg',
       screen: isMovie ? Routes.movieDetails: Routes.tvDetails,
      ),
      itemCount: 8,
    );
  }
}