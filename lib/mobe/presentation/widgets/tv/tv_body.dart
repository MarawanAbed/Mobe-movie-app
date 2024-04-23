

import 'package:movie_app/mobe/presentation/widgets/tv/popular_bloc_consumer.dart';
import 'package:movie_app/mobe/presentation/widgets/tv/top_rated_bloc_consumer.dart';

import '../../../../../lib_imports.dart';
import 'airing_today_bloc_consumer.dart';

class TvBody extends StatelessWidget {
  const TvBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AiringTodayBlocConsumer(),
              HelperMethod.verticalSpace(20),
              const PopularBlocConsumer(),
              HelperMethod.verticalSpace(20),
              const TopRatedBlocConsumer(),
            ],
          ),
        ),
      ),
    );
  }
}
