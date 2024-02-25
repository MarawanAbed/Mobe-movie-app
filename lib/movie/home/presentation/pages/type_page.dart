import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/type/type_body.dart';

class TypePage extends StatelessWidget {
  const TypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Type Page'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: TypeBody(),
        ),
      ),
    );
  }
}
