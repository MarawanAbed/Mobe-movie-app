import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/movie/home/presentation/widgets/view_all/view_all_body.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key, required this.title, required this.isMovie});

  final String title;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        appBar: AppBar(
          title: isMovie ? Text('$title Movie') : Text('$title Tv'),
        ),
        body: const ViewAllBody(),
      ),
    );
  }
}
