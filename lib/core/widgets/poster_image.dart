import '../../lib_imports.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({
    super.key,
    required this.image,
    this.tv,
    this.movie,
  });

  final String image;
  final TvDetailsModel? tv;
  final MovieDetailsModel? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: const AssetImage(AppImages.placeholder),
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
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.33,
              ),
            );
          },
          image: CachedNetworkImageProvider(tv == null
              ? image + (movie?.posterPath ?? AppImages.placeholder)
              : image + (tv?.posterPath ?? AppImages.placeholder)),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}