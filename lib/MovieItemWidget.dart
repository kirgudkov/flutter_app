import 'package:flutter/material.dart';
import 'model/Movie.dart';

class MovieItemWidget extends StatelessWidget {
  MovieItemWidget({Key key, this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            child: Row(
              children: <Widget>[
                Image.network(movie.artworkUrl100),
                Column(
                  children: <Widget>[
                    Text(movie.artistName),
                    Text(movie.trackName),
                    Text(movie.trackPrice.toString()),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
