import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/gallery_3d.dart';

import '../commmon/row_view_all.dart';

class MovieBody extends StatelessWidget {
  const MovieBody({super.key});
  Widget buildSection(String title, bool isMovie) {
    return Column(
      children: [
        RowViewAll(
          title: title,
          onTap: () {
            Navigators.pushNamed(Routes.viewAll, arguments: {
              'title': title,
              'isMovie': isMovie,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        const Gallery3DItems(),
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
          for (var title in ['Upcoming', 'Popular', 'Top Rated'])
            buildSection(title, true),
        ],
      ),
    );
  }
}

// class MovieBody extends StatelessWidget {
//   const MovieBody({super.key});
//   Widget buildSection(String title, bool isMovie) {
//     return Column(
//       children: [
//         RowViewAll(
//           title: title,
//           onTap: () {
//             Navigators.pushNamed(Routes.viewAllScreen, arguments: {
//               'title': title,
//               'isMovie': isMovie,
//             });
//           },
//         ),
//         HelperMethod.verticalSpace(20),
//         const Gallery3DItems(),
//         HelperMethod.verticalSpace(20),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           RowViewAll(
//             title: 'Upcoming ',
//             onTap: () {
//               Navigators.pushNamed(Routes.viewAllScreen, arguments: {
//                 'title': 'Upcoming',
//                 'isMovie': true,
//               });
//             },
//           ),
//           HelperMethod.verticalSpace(20),
//           const Gallery3DItems(),
//           HelperMethod.verticalSpace(20),
//           RowViewAll(
//             title: 'Popular ',
//             onTap: () {
//               Navigators.pushNamed(Routes.viewAllScreen, arguments: {
//                 'title': 'Popular',
//                 'isMovie': true,
//               });
//             },
//           ),
//           HelperMethod.verticalSpace(20),
//           const Gallery3DItems(),
//           HelperMethod.verticalSpace(20),
//           RowViewAll(
//             title: 'Top Rated ',
//             onTap: () {
//               Navigators.pushNamed(Routes.viewAllScreen, arguments: {
//                 'title': 'Top Rated',
//                 'isMovie': true,
//               });
//             },
//           ),
//           HelperMethod.verticalSpace(20),
//           const Gallery3DItems(),
//         ],
//       ),
//     );
//   }
// }
