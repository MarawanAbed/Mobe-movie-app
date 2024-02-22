import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/movie/home/presentation/pages/tv_page.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'category_page.dart';
import 'favorite_page.dart';
import 'movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const MoviePage(),
    const TvPage(),
    const CategoryPage(),
    const FavoritePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomBarItem buildBottomBarItem(IconData icon, String title) {
    return BottomBarItem(
      icon: Icon(icon),
      selectedColor: Colors.blue,
      unSelectedColor: Colors.blueGrey,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          child: StylishBottomBar(
            borderRadius: BorderRadius.circular(30),
            currentIndex: _currentIndex,
            backgroundColor: AppColors.kBackGroundNavBar,
            onTap: onTabTapped,
            items: [
              buildBottomBarItem(Icons.movie, 'Movie'),
              buildBottomBarItem(Icons.tv, 'Tv'),
              buildBottomBarItem(Icons.category, 'Category'),
              buildBottomBarItem(Icons.favorite, 'Favorite'),
            ],
            option: AnimatedBarOptions(
              iconSize: 32,
              barAnimation: BarAnimation.fade,
              iconStyle: IconStyle.animated,
              opacity: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
