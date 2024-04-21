import 'package:flutter_offline/flutter_offline.dart';
import 'package:movie_app/lib_imports.dart';

import '../../widgets/home/custom_app_bar_category_and_favorite.dart';
import '../../widgets/home/custom_app_bar_movie_and_tv.dart';
import '../../widgets/home/custom_bottom_bar.dart';


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
    AppStrings.movie,
    AppStrings.tv,
    AppStrings.category,
    AppStrings.favorite,
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
        appBar: titles[_currentIndex] == AppStrings.category ||
                titles[_currentIndex] == AppStrings.favorite
            ? CustomAppBarCategoryAndFavorite(
                title: titles[_currentIndex],
              ) as PreferredSizeWidget?
            : CustomAppBarMovieAndTv(
                title: titles[_currentIndex],
                isMovie: _currentIndex == 0, // Pass isMovie here
              ),
        body: OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return child;
              } else {
                return const Center(
                  child: Text('No Internet Connection'),
                );
              }
            },
            child: _children[_currentIndex]
        ),
        bottomNavigationBar: CustomStylishBottomBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
        ),
      ),
    );
  }
}
