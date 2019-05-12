import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/Movie.dart';

class MovieInfo extends StatelessWidget {
  MovieInfo({this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: '${movie.trackId}_image',
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(movie.artworkUrl100, fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 24),
                  padding: EdgeInsets.only(left: 12),
                  child: SizedBox(
                      width: 22,
                      height: 22,
                      child: IconButton(
                          icon: Icon(Icons.close), iconSize: 24, color: Colors.white, padding: EdgeInsets.all(0), onPressed: () => Navigator.pop(context))),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 12, left: 12, bottom: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: Colors.transparent,
                      child: Text(movie.trackName, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white))),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      movie.artistName,
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Material(
                      color: Colors.transparent,
                      child: Text(movie.trackPrice != null ? movie.trackPrice.toString() : '', style: TextStyle(color: Colors.white54, fontSize: 20))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
