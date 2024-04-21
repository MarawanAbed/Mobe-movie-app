import '../../../../../lib_imports.dart';

class MoviePageDetails extends StatelessWidget {
  const MoviePageDetails({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        body: MovieDetailsBody(
          id: id,
        ),
      ),
    );
  }
}
