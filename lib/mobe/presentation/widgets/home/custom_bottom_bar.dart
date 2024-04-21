import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class CustomStylishBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomStylishBottomBar(
      {super.key, required this.currentIndex, required this.onTap});

  BottomBarItem buildBottomBarItem(IconData icon, String title, Color color) {
    return BottomBarItem(
      icon: Icon(
        icon,
        color: color,
      ),
      selectedColor: color,
      unSelectedColor: Colors.blueGrey,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      currentIndex: currentIndex,
      backgroundColor: AppColors.kBackGroundNavBar,
      onTap: onTap,
      items: [
        buildBottomBarItem(Icons.movie, AppStrings.movie, Colors.red),
        buildBottomBarItem(Icons.tv, AppStrings.tv, Colors.green),
        buildBottomBarItem(Icons.category, AppStrings.category, Colors.blue),
        buildBottomBarItem(Icons.favorite, AppStrings.favorite, Colors.purple),
       ],
      option: AnimatedBarOptions(
        iconSize: 32,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.animated,
        opacity: 0.3,
      ),
    );
  }
}
