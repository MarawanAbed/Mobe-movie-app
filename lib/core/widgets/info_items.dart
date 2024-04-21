

import '../../lib_imports.dart';

class InfoItems extends StatelessWidget {
  const InfoItems({
    super.key,
    required this.releaseDate,
    required this.voteAverage,
  });

  final String releaseDate;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReleaseDate(
          releaseDate: releaseDate,
        ),
        HelperMethod.horizontalSpace(20),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              voteAverage.toStringAsFixed(1),
            ),
          ],
        ),
      ],
    );
  }
}
