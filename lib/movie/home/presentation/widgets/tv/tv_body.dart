import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/build_item_images.dart';

import '../commmon/row_view_all.dart';

class TvBody extends StatelessWidget {
  const TvBody({super.key});

  Widget buildSection(String title, bool isMovie) {
    return Column(
      children: [
        RowViewAll(
          title: title,
          onTap: () {
            Navigators.pushNamed(Routes.viewAllScreen, arguments: {
              'title': title,
              'isMovie': isMovie,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        const BuildItemImages(
          screen: Routes.tvDetailsScreen,
        ),
        HelperMethod.verticalSpace(20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          for (var title in ['Airing Today', 'Popular', 'Top Rated'])
            buildSection(title, false),
        ],
      ),
    );
  }
}



//class TvBody extends StatelessWidget {
//   const TvBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           RowViewAll(
//             title: 'Airing Today',
//             onTap: () {
//               Navigators.pushNamed(Routes.viewAllScreen, arguments: {
//                 'title': 'Airing Today',
//                 'isMovie': false,
//               });
//             },
//           ),
//           HelperMethod.verticalSpace(20),
//           const BuildItemImages(),
//           HelperMethod.verticalSpace(20),
//           RowViewAll(
//             title: 'Popular',
//             onTap: () {
//               Navigators.pushNamed(Routes.viewAllScreen, arguments: {
//                 'title': 'Popular',
//                 'isMovie': false,
//               });
//             },
//           ),
//           HelperMethod.verticalSpace(20),
//           const BuildItemImages(),
//           HelperMethod.verticalSpace(20),
//           RowViewAll(
//             title: 'Top Rated',
//             onTap: () {
//               Navigators.pushNamed(Routes.viewAllScreen, arguments: {
//                 'title': 'Top Rated',
//                 'isMovie': false,
//               });
//             },
//           ),
//           HelperMethod.verticalSpace(20),
//           const BuildItemImages(),
//         ],
//       ),
//     );
//   }
// }