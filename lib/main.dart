import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Repository.dart';

import 'MovieItemWidget.dart';
import 'model/MovieList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: MyHomePage(title: 'Itunes movie search'),
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
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(handleOnScroll);
  }

  void handleOnScroll() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void setIsLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  void setList(MovieList movieList) {
    setIsLoading(false);
    this.movieList = movieList;
  }

  void handleOnSearchTextChanged(String text) {
    setIsLoading(true);
    Repository.find(text).then(setList);
  }

  Widget getButtonChild() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
      width: isLoading ? 20 : 200,
      child: isLoading ? getProgressIndicator() : Text('Search', maxLines: 1, softWrap: false, textAlign: TextAlign.center),
    );
  }

  Widget getProgressIndicator() {
    return SizedBox(
      child: CircularProgressIndicator(
        value: isLoading ? null : 1,
        strokeWidth: 1.5,
        backgroundColor: Colors.redAccent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
      height: 20,
      width: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: Color(0x99eeeeee),
        child: GestureDetector(
          onTap: handleOnScroll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                      getProgressIndicator(),
                      TextField(decoration: InputDecoration.collapsed(hintText: 'Search movie...'), onChanged: handleOnSearchTextChanged),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: movieList != null ? movieList.results.length : 0,
                      itemBuilder: (context, position) {
                        return MovieItemWidget(movie: movieList.results[position]);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
