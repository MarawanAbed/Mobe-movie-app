import 'package:flutter/material.dart';
import 'package:movie_app/core/services/navigator.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String screen;
  final dynamic arguments;

  const CategoryItems({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.screen,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigators.pushNamed(screen, arguments: arguments);
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
