import 'package:movie_app/mobe/presentation/widgets/movie/popular_bloc_consumer.dart';
import 'package:movie_app/mobe/presentation/widgets/movie/top_rated_bloc_consumer.dart';
import 'package:movie_app/mobe/presentation/widgets/movie/up_coming_bloc_consumer.dart';

import '../../../../../lib_imports.dart';

class MovieBody extends StatelessWidget {
  const MovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UpComingBlocConsumer(),
              HelperMethod.verticalSpace(20),
              const PopularBlocConsumer(),
              HelperMethod.verticalSpace(20),
              const TopRatedBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
