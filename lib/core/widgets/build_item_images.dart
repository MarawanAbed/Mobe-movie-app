import '../../lib_imports.dart';
import 'image_items.dart';

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
              image: ApiConstant.imageBaseUrl +
                  (movies![index].posterPath ?? AppImages.placeholder),
              arguments: movies![index].id,
            );
          } else if (tv != null) {
            return ImageItems(
              screen: screen,
              image: ApiConstant.imageBaseUrl +
                  (tv![index].posterPath ?? AppImages.placeholder),
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
