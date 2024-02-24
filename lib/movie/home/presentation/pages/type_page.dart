import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/image_items.dart';

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

class TypeBody extends StatelessWidget {
  const TypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => const ImageItems(),
      itemCount: 8,
    );
  }
}
