import 'package:flutter/material.dart';

class RowViewAll extends StatelessWidget {
  const RowViewAll({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 20),),
        const Spacer(),
        const Text(
          'View All',
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
    );
  }
}