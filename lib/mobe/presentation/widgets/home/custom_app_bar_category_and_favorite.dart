import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/sizes.dart';

class CustomAppBarCategoryAndFavorite extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarCategoryAndFavorite({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(title),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.kDefaultHeight50);
}
