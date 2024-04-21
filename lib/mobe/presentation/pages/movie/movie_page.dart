import 'package:flutter_offline/flutter_offline.dart';

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
              return const Center(
                child: Text('No Internet Connection'),
              );
            }
          },
          child: const MovieBody(),
        ),
      ),
    );
  }
}
