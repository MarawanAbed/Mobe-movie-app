import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../lib_imports.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({
    super.key,
    this.tv,
    this.movie,
    required this.isMovie,
  });

  final TvDetailsModel? tv;
  final MovieDetailsModel? movie;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            _launcherUrl(isMovie ? movie!.id! : tv!.id!);
          },
        ),
      ),
    );
  }

  void _launcherUrl(int id) async {
    final url = isMovie
        ? await getIt<GetMovieVideos>().call(id)
        : await getIt<GetTvVideos>().call(id);
    url.when(
      success: (data) async {
        if (await canLaunchUrlString(data)) {
          await launchUrlString(data);
        }
      },
      failure: (error) {
        HelperMethod.showSuccessToast(
          isMovie ? AppStrings.videoMovieError : AppStrings.videoTvError,
          gravity: ToastGravity.BOTTOM,
        );
      },
    );
  }
}
