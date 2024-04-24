import '../../lib_imports.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.signal_wifi_off,
            size: 50,
            color: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Please check your network settings',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}