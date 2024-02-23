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

  final List<String>titles = [
    'Movie',
    'Tv',
    'Category',
    'Favorite',
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomBarItem buildBottomBarItem(IconData icon, String title,Color color) {
    return BottomBarItem(
      icon: Icon(icon,color: color,),
      selectedColor: color,
      unSelectedColor: Colors.blueGrey,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(titles[_currentIndex]),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
              },
            ),
          ],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: StylishBottomBar(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          currentIndex: _currentIndex,
          backgroundColor: AppColors.kBackGroundNavBar,
          onTap: onTabTapped,
          items: [
            buildBottomBarItem(Icons.movie, 'Movie',Colors.red),
            buildBottomBarItem(Icons.tv, 'Tv',Colors.green),
            buildBottomBarItem(Icons.category, 'Category',Colors.blue),
            buildBottomBarItem(Icons.favorite, 'Favorite',Colors.purple),
          ],
          option: AnimatedBarOptions(
            iconSize: 32,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.animated,
            opacity: 0.3,
          ),
        ),
      ),
    );
  }
}
