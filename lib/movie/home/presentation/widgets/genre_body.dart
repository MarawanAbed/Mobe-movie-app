import 'package:flutter/material.dart';

class GenreBody extends StatefulWidget {
  const GenreBody({super.key, required this.title});
  final String title;
  @override
  State<GenreBody> createState() => _GenreBodyState();
}

class _GenreBodyState extends State<GenreBody> {

  final List<String> movieGenre=
  [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Music',
    'Mystery',
    'Romance',
    'Science Fiction',
    'TV Movie',
    'Thriller',
    'War',
    'Western',
  ];

  final List<String>tvGenre=[
    'Action & Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Kids',
    'Mystery',
    'News',
    'Reality',
    'Sci-Fi & Fantasy',
    'Soap',
    'Talk',
    'War & Politics',
    'Western',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.title=='Movie')
          ...movieGenre.map((e) => GenreItem(title: e)).toList(),
        if(widget.title=='Tv')
          ...tvGenre.map((e) => GenreItem(title: e)).toList(),
      ],
    );
  }
}

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}