import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';

class InfoItems extends StatelessWidget {
  const InfoItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red.withOpacity(0.9),
          ),
          child: const Text(
            '2022',
          ),
        ),
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
