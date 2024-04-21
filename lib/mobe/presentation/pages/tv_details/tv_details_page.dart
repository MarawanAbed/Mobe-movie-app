
import '../../../../../lib_imports.dart';

class TvPageDetails extends StatelessWidget {
  const TvPageDetails({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        body: TvDetailsBody(
          id: id,
        ),
      ),
    );
  }
}
