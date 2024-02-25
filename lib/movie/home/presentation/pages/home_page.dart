import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/pages/tv_page.dart';
import 'package:movie_app/movie/home/presentation/widgets/home/custom_app_bar.dart';
import 'package:movie_app/movie/home/presentation/widgets/home/custom_bottom_bar.dart';

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

  final List<String> titles = [
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: titles[_currentIndex]),
        body: _children[_currentIndex],
        bottomNavigationBar: CustomStylishBottomBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
        ),
      ),
    );
  }
}
