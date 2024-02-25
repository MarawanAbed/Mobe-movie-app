import 'package:flutter/material.dart';

class TvPoster extends StatelessWidget {
  const TvPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/aPw5rLRclUx14T8lUNkGlrGVfow.jpg',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.33,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 30,
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
