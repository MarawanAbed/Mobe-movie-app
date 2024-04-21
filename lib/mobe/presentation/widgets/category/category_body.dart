

import '../../../../../lib_imports.dart';
import '../../../../../core/widgets/category_items.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryItems(
          title: AppStrings.movie,
          icon: Icons.movie,
          color: Colors.red,
          screen: Routes.genre,
          arguments:  {
            'title': AppStrings.movie,
            'isMovie': true,
          }),
        CategoryItems(
          title: AppStrings.tv,
          icon: Icons.tv,
          screen: Routes.genre,
          arguments:  {
            'title': AppStrings.tv,
            'isMovie': false,
          },
          color: Colors.green,
        ),
      ],
    );
  }
}
