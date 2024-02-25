import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/app_text_form.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Search',
            onChanged: (value) {
            },
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),


          ),
          const SizedBox(
            height: 20.0,
          ),
          const Expanded(
            child: Center(
              child: Text('Search Result'),
            ),
          ),
        ],
      ),
    );
  }
}