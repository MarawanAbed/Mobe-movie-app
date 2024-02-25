import 'package:flutter/material.dart';

class CustomAppBarCategoryAndFavorite extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarCategoryAndFavorite({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title:  Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
