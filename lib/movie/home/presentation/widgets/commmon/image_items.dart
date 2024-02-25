import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';

class ImageItems extends StatelessWidget {
  const ImageItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(Routes.homeDetailsScreen);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/24CL0ySodCF8bcm38xtBeHzHp7W.jpg',
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
      ),
    );
  }
}
