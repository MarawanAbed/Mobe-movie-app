
import '../../lib_imports.dart';

class ImageItems extends StatelessWidget {
  const ImageItems({
    super.key,
    required this.screen,
    required this.image,
    this.arguments,
  });

  final String screen;
  final String? image;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(screen, arguments: arguments);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          placeholder: const AssetImage(AppImages.placeholder),
          image: CachedNetworkImageProvider(image??AppImages.placeholder),
          imageErrorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                AppImages.errorSvg,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            );
          },
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
      ),
    );
  }
}
