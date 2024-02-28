import 'package:flutter/material.dart';
import '../../widgets/tv/tv_body.dart';

class TvPage extends StatelessWidget {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: TvBody(),
        ),
      ),
    );
  }
}
