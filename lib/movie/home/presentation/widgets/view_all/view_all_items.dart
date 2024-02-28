import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/info_items.dart';

class ViewAllItems extends StatelessWidget {
  const ViewAllItems({
    super.key,
    required this.isMovie,
    this.tv,
    this.movie,
  });

  final bool isMovie;
  final TvModel? tv;
  final MovieModel? movie;

  @override
  Widget build(BuildContext context) {
    const images = ApiConstant.imageBaseUrl;
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: AppColors.kBackGround,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: isMovie
                    ? '$images${movie!.posterPath}'
                    : '$images${tv!.posterPath}',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
          ),
          HelperMethod.horizontalSpace(20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isMovie ? movie!.title : tv!.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                HelperMethod.verticalSpace(10),
                const InfoItems(),
                HelperMethod.verticalSpace(10),
                Expanded(
                  child: Text(
                    isMovie ? movie!.overview : tv!.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
