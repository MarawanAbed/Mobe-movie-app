import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class ViewAllBody extends StatelessWidget {
  const ViewAllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => const ViewAllItems(),
        separatorBuilder: (context, index) => HelperMethod.verticalSpace(20),
        itemCount: 8,
      ),
    );
  }
}

class ViewAllItems extends StatelessWidget {
  const ViewAllItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: AppColors.kBackGround,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppImages.onBoarding1,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height,
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
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(0.9),
                      ),
                      child: const Text(
                        '2022',
                      ),
                    ),
                    HelperMethod.horizontalSpace(10),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('9.0'),
                      ],
                    ),
                  ],
                ),
                HelperMethod.verticalSpace(10),
                const Expanded(
                  child: Text(
                    'Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                    textAlign: TextAlign.justify,
                    maxLines: 2,
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