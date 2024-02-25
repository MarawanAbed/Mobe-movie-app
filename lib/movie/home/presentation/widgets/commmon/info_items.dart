import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/release_date.dart';

class InfoItems extends StatelessWidget {
  const InfoItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ReleaseDate(),
        HelperMethod.horizontalSpace(20),
        const Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 5,
            ),
            Text('9.0'),
          ],
        ),
      ],
    );
  }
}
