import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/movie/home/presentation/widgets/category/category_body.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: CategoryBody(),
        ),
      ),
    );
  }
}



