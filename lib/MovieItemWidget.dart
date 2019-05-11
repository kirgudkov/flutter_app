import 'package:flutter/material.dart';
import 'model/Movie.dart';

class MovieItemWidget extends StatelessWidget {
  MovieItemWidget({Key key, this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4, top: 0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xddddddff), width: 0.5, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
              child: Row(
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(movie.artworkUrl100, fit: BoxFit.cover),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(movie.artistName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.redAccent)),
                      Text(movie.trackName),
                      Text(movie.trackPrice.toString()),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
