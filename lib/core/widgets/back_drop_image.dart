import '../../lib_imports.dart';

class BackDropImage extends StatelessWidget {
  const BackDropImage({
    super.key,
    required this.image,
    this.tv,
    this.movie,
    required this.isMovie,
  });

  final String image;
  final TvDetailsModel? tv;
  final MovieDetailsModel? movie;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: FadeInImage(
        placeholder: const AssetImage(AppImages.placeholder),
        width: MediaQuery.of(context).size.width,
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33,
            ),
          );
        },
        image:isMovie? CachedNetworkImageProvider(
          image + (movie?.backdropPath ?? AppImages.placeholder),
        ):CachedNetworkImageProvider(
          image + (tv?.backdropPath ?? AppImages.placeholder),
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
