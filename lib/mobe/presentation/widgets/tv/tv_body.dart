

import 'package:movie_app/mobe/presentation/widgets/tv/popular_bloc_consumer.dart';
import 'package:movie_app/mobe/presentation/widgets/tv/top_rated_bloc_consumer.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/utils/sizes.dart';
import 'airing_today_bloc_consumer.dart';

class TvBody extends StatelessWidget {
  const TvBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AiringTodayBlocConsumer(),
              SizedBox(
                height: AppSizes.kDefaultHeight20,
              ),
              PopularBlocConsumer(),
              SizedBox(
                height: AppSizes.kDefaultHeight20,
              ),
              TopRatedBlocConsumer(),
            ],
          ),
        ),
      ),
    );
  }
}
