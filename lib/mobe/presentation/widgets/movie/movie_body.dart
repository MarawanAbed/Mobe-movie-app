import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/widgets/movie/popular_bloc_consumer.dart';
import 'package:movie_app/mobe/presentation/widgets/movie/top_rated_bloc_consumer.dart';
import 'package:movie_app/mobe/presentation/widgets/movie/up_coming_bloc_consumer.dart';

import '../../../../../lib_imports.dart';

class MovieBody extends StatelessWidget {
  const MovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSizes.kDefaultPadding10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UpComingBlocConsumer(),
              SizedBox(
                height: AppSizes.kDefaultHeight20,
              ),
              PopularBlocConsumer(),
              SizedBox(
                height: AppSizes.kDefaultHeight20,
              ),
              TopRatedBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
