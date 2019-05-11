import 'package:flutter/material.dart';
import 'package:flutter_app/Repository.dart';

import 'model/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.redAccent),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLoading = false;
  User user;

  void setIsLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void setUser(User user) {
    setIsLoading(false);
    this.user = user;
  }

  void _getUser() {
    setIsLoading(true);
    Repository.getUser().then(setUser);
  }

  Widget getButtonChild() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
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
          : Text('Обновить пользователя', maxLines: 1, softWrap: false, textAlign: TextAlign.center),
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
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      user != null
                          ? '${user.name} ${user.surname} нажал кнопку вот столько раз:'
                          : 'Вы нажали кнопку вот столько раз:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
                    RaisedButton(
                      onPressed: _decrementCounter,
                      textColor: Colors.redAccent,
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      child: Text('-'),
                    ),
                    RaisedButton(
                      onPressed: _incrementCounter,
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Text('+'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
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
            )
          ],
        ),
      ),
    );
  }
}
