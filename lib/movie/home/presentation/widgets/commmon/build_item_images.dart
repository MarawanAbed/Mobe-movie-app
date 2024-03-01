import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/image_items.dart';

class BuildItemImages extends StatelessWidget {
  const BuildItemImages(
      {super.key, required this.screen, this.movies, this.tv});

  final String screen;
  final List<MovieModel>? movies;
  final List<TvModel>? tv;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: movies != null ? movies!.length : tv!.length,
        itemBuilder: (context, index) {
          if (movies != null) {
            return ImageItems(
              screen: screen,
              image: ApiConstant.imageBaseUrl + (movies![index].posterPath!),
              arguments: movies![index].id,
            );
          } else if (tv != null) {
            return ImageItems(
              screen: screen,
              image: ApiConstant.imageBaseUrl + (tv![index].posterPath ),
              arguments: tv![index].id,
            );
          } else {
            return Container();
          }
        },
        separatorBuilder: (context, index) => HelperMethod.horizontalSpace(10),
      ),
    );
  }
}

//          return ImageItems(
//             imageUrl: movies != null ? ApiConstant.imageUrl + movies![index].posterPath : ApiConstant.imageUrl + tv![index].posterPath,
//             onTap: () {
//               Navigators.pushNamed(
//                 screen,
//                 arguments: movies != null ? movies![index] : tv![index],
//               );
//             },
//           );
