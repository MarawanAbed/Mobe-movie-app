import 'package:flutter_offline/flutter_offline.dart';
import 'package:movie_app/core/widgets/no_internet_connection.dart';

import '../../../../../lib_imports.dart';



class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return child;
            } else {
              return const NoInternetConnection();
            }
          },
          child: const MovieBody(),
        ),
      ),
    );
  }
}
