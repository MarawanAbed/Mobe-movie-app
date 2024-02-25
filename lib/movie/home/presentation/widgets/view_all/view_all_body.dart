import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/presentation/widgets/view_all/view_all_items.dart';

class ViewAllBody extends StatelessWidget {
  const ViewAllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,top: 20, bottom: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => const ViewAllItems(),
        separatorBuilder: (context, index) => HelperMethod.verticalSpace(20),
        itemCount: 8,
      ),
    );
  }
}
