import 'package:flutter/material.dart';
import 'model/Movie.dart';

class MovieItemWidget extends StatelessWidget {
  MovieItemWidget({Key key, this.movie, this.onTap});

  final Movie movie;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4, top: 0),
      child: GestureDetector(
        onTap: () => onTap(movie),
        child: Card(
          color: Color(0xff393939),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: 65,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: '${movie.trackId}_image',
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(movie.artworkUrl100, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                              color: Colors.transparent,
                              child: Text(movie.trackName, maxLines: 1, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              movie.artistName,
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                          Material(
                              color: Colors.transparent,
                              child: Text(movie.trackPrice != null ? movie.trackPrice.toString() : '', style: TextStyle(color: Colors.white54))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
