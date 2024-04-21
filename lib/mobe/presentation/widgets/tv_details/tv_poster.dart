

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../lib_imports.dart';

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
                placeholder: const AssetImage(AppImages.placeholder),
                // width: MediaQuery.of(context).size.width * 0.5,
                // height: MediaQuery.of(context).size.height * 0.33,
                imageErrorBuilder: (context, error, stackTrace) {
                  return AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        AppImages.errorSvg,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.33,
                      ),
                    ),
                  );
                },
                image: CachedNetworkImageProvider(image + (tv.posterPath??AppImages.placeholder)),
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
                  _launcherUrl(tv.id!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _launcherUrl(int id) async {
  final url = await getIt<GetTvVideos>().call(id);
  url.when(
    success: (data) async {
      if (await canLaunchUrlString(data)) {
        await launchUrlString(data);
      }
    },
    failure: (error) {
      HelperMethod.showSuccessToast(AppStrings.videoTvError,
          gravity: ToastGravity.BOTTOM);
    },
  );
}
