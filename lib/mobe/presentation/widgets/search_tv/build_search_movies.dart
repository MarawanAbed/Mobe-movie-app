

import '../../../../../lib_imports.dart';

class BuildSearchTv extends StatelessWidget {
  const BuildSearchTv({super.key, required this.tv});

  final List<TvModel> tv;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ImageItems(
        image: image + (tv[index].posterPath??AppImages.placeholder),
        screen: Routes.tvDetails,
        arguments: tv[index].id,
      ),
      itemCount: tv.length,
    );
  }
}
