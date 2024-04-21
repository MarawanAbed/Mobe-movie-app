
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../lib_imports.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.movies});

  final MovieDetailsModel movies;

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
                image: CachedNetworkImageProvider((image + (movies.posterPath??AppImages.placeholder))),
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.33,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      AppImages.errorSvg,
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  );
                },
              ),
              ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 30,
              child: IconButton(
                icon:const Icon(Icons.play_arrow, size: 30, color: Colors.white),
                onPressed: () async {
                  _launcherUrl(movies.id??0);
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
  final url = await getIt<GetMovieVideos>().call(id);
  url.when(
    success: (data) async {
      if (await canLaunchUrlString(data)) {
        await launchUrlString(data);
      }
    },
    failure: (error) {
     HelperMethod.showSuccessToast(AppStrings.videoMovieError,gravity: ToastGravity.BOTTOM);
    },
  );
}