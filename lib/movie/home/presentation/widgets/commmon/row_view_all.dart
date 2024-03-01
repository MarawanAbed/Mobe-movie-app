import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/strings.dart';

class RowViewAll extends StatelessWidget {
  const RowViewAll({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 20),),
          const Spacer(),
          const Text(
            AppStrings.viewAll,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}