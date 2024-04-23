import 'package:movie_app/mobe/presentation/widgets/view_all/airing_today_view_all_bloc_consumer.dart';

import '../../../../lib_imports.dart';

class AiringTodayViewAllPage extends StatelessWidget {
  const AiringTodayViewAllPage({super.key, required this.title,});

  final String title;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        appBar: AppBar(
          title: Text('$title ${ AppStrings.movie}'),
        ),
        body: const AiringTodayViewAllBlocConsumer(),
      ),
    );
  }
}
