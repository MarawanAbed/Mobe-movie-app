import 'package:flutter/material.dart';

import '../assets/images.dart';

class ImageAndShadow extends StatelessWidget {
  const ImageAndShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0, 0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        AppImages.onBoarding1,
        fit: BoxFit.cover,
      ),
    );
  }
}
