import 'package:filmfolio/model/movie_data.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MovieTile extends StatelessWidget {
  final GetIt _getit = GetIt.instance;
  final double height;
  final double width;
  final Movie movie;

  MovieTile({required this.width, required this.height, required this.movie});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _moviePosterWidget(movie.posterURL()),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String? _imageURL) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(_imageURL!),
      )),
    );
  }
}
