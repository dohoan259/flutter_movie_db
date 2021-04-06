import 'package:flutter/material.dart';

class MovieItemList extends StatelessWidget {
  MovieItemList({required this.posterPath});

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        child: Image.network(
          posterPath,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
