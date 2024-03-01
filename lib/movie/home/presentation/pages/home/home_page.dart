import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/pages/favorite/favorite_page.dart';
import 'package:movie_app/movie/home/presentation/pages/tv/tv_page.dart';
import 'package:movie_app/movie/home/presentation/widgets/home/custom_app_bar_category_and_favorite.dart';
import 'package:movie_app/movie/home/presentation/widgets/home/custom_app_bar_movie_and_tv.dart';
import 'package:movie_app/movie/home/presentation/widgets/home/custom_bottom_bar.dart';

import '../category/category_page.dart';
import '../movie/movie_page.dart';

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
        appBar: titles[_currentIndex] == 'Category'|| titles[_currentIndex] == 'Favorite'
            ? CustomAppBarCategoryAndFavorite(
                title: titles[_currentIndex],
              ) as PreferredSizeWidget?
            : CustomAppBarMovieAndTv(
                title: titles[_currentIndex],
                isMovie: _currentIndex == 0, // Pass isMovie here
              ),
        body: _children[_currentIndex],
        bottomNavigationBar: CustomStylishBottomBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
        ),
      ),
    );
  }
}
