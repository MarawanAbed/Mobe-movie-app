import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/di/dependancy_injection.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/movie/home/data/models/tv_details_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_tv_videos.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TvPoster extends StatelessWidget {
  const TvPoster({super.key, required this.tv});

  final TvDetailsModel tv;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:  const AssetImage(AppImages.placeholder),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.33,
                image: CachedNetworkImageProvider(image + tv.posterPath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 30,
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  _launcherUrl(tv.id);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


}
void _launcherUrl(int id)async
{
  final url = await getIt<GetTvVideos>().call(id);
  url.when(
    success: (data) async {
      if (await canLaunchUrlString(data)) {
        await launchUrlString(data);
      }
    },
    failure: (error) {
      HelperMethod.showErrorToast('There is no video available for this TvSeries.');
    },
  );
}