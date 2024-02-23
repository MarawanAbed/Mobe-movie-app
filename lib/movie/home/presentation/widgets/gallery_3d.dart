import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:movie_app/core/assets/images.dart';

class Gallery3DItems extends StatefulWidget {
  const Gallery3DItems({super.key});

  @override
  State<Gallery3DItems> createState() => _Gallery3DItemsState();
}

class _Gallery3DItemsState extends State<Gallery3DItems> {

  final List<String> images = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
    AppImages.onBoarding4,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Gallery3D(
      controller: Gallery3DController(itemCount: images.length),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 300,
      isClip: true,
      // ellipseHeight: 80,
      onItemChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemConfig: const GalleryItemConfig(
        width: 220,
        height: 300,
        radius: 10,
        isShowTransformMask: false,
      ),
      onClickItem: (index) {
        if (kDebugMode) print("currentIndex:$index");
      },
      itemBuilder: (context, index) {
        return Image.asset(
          images[index],
          fit: BoxFit.fill,
        );
      },
    );
  }
}