import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/movie/home/presentation/widgets/info_items.dart';

class ViewAllItems extends StatelessWidget {
  const ViewAllItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: AppColors.kBackGround,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppImages.onBoarding1,
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
          ),
          HelperMethod.horizontalSpace(20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title movie',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                HelperMethod.verticalSpace(10),
                const InfoItems(),
                HelperMethod.verticalSpace(10),
                const Expanded(
                  child: Text(
                    'Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


