
import '../../../../../lib_imports.dart';

class BuildType extends StatelessWidget {
  const BuildType({super.key, required this.isMovie, this.tv,this.movies});
  final bool isMovie;
  final List<TvModel>?tv;
  final List<MovieModel>?movies;
  @override
  Widget build(BuildContext context) {
    const image=ApiConstant.imageBaseUrl;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ImageItems(
        image:  isMovie?image+(movies![index].posterPath??AppImages.placeholder): image+(tv![index].posterPath??AppImages.placeholder),
        screen: isMovie ? Routes.movieDetails: Routes.tvDetails,
        arguments: isMovie? movies![index].id: tv![index].id,
      ),
      itemCount: isMovie? movies!.length: tv!.length,
    );
  }
}
