import 'package:flutter/material.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/image_items.dart';

import '../../../../../core/assets/images.dart';

class BuildSearchTv extends StatelessWidget {
  const BuildSearchTv({super.key, required this.tv});

  final List<TvModel> tv;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ImageItems(
        image: image + (tv[index].posterPath??AppImages.placeholder),
        screen: Routes.tvDetails,
        arguments: tv[index].id,
      ),
      itemCount: tv.length,
    );
  }
}
