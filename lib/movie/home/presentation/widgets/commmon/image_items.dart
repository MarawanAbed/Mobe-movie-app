import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/services/navigator.dart';

class ImageItems extends StatelessWidget {
  const ImageItems({
    super.key,
    required this.screen,
    required this.image,
    this.arguments,
  });

  final String screen;
  final String image;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(screen,arguments:arguments );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          placeholder: const AssetImage(AppImages.placeholder),
          image: CachedNetworkImageProvider(image),
          imageErrorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
      ),
    );
  }
}
//Image.network(
//           'https://image.tmdb.org/t/p/w500/24CL0ySodCF8bcm38xtBeHzHp7W.jpg',
//           fit: BoxFit.contain,
//           width: MediaQuery.of(context).size.width * 0.4,
//         )
