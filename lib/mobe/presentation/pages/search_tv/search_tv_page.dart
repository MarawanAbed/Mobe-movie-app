import 'package:flutter_offline/flutter_offline.dart';
import 'package:movie_app/core/widgets/no_internet_connection.dart';

import '../../../../../lib_imports.dart';

class SearchTvPage extends StatelessWidget {
  const SearchTvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.searchTv),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return child;
            } else {
              return const NoInternetConnection();
            }
          },
          child: const SearchTvBody(),
        ),
      ),
    );
  }
}
