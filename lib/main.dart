import 'package:flutter/material.dart';
import 'package:flutter_app/Repository.dart';

import 'MovieItemWidget.dart';
import 'model/MovieList.dart';
import 'model/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  MovieList movieList;

  void setIsLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  void setList(MovieList movieList) {
    setIsLoading(false);
    this.movieList = movieList;
  }

  void _getUser() {
    setIsLoading(true);
    Repository.find('очень').then(setList);
  }

  Widget getButtonChild() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
      width: isLoading ? 20 : 200,
      child: isLoading
          ? SizedBox(
              child: CircularProgressIndicator(
                value: isLoading ? null : 1,
                strokeWidth: 1.5,
                backgroundColor: Colors.redAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              height: 20,
              width: 20,
            )
          : Text('Обновить список',
              maxLines: 1, softWrap: false, textAlign: TextAlign.center),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//            Container(
//              child: TextField(),
//            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                    itemCount: movieList != null ? movieList.results.length : 0,
                    itemBuilder: (context, position) {
                      return MovieItemWidget(
                          movie: movieList.results[position]);
                    }),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  onPressed: isLoading ? null : _getUser,
                  disabledColor: Color(0xFFFFFFFF),
                  highlightElevation: 0,
                  elevation: 0,
                  disabledElevation: 0,
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: getButtonChild(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
