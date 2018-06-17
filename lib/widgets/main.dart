import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sea_buttle_flutter/widgets/game_configuration.dart';
import 'package:sea_buttle_flutter/widgets/highscores.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sea battle',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flatter Sea Battle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body:
      new Stack(
children: <Widget>[
  new Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(image: new AssetImage("resources/images/mainback.jpg"), fit: BoxFit.cover,),
    ),
  ),
      new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(10.0),
              child:
            new RaisedButton(
              onPressed: (){
                Navigator.push(context,
                new MaterialPageRoute(builder: (context){return new GameConfiguration();})
                );
              },
              child: new Text("Start New Game",style: new TextStyle(
    color: Colors.redAccent)),
            )),
new Container(
    padding: EdgeInsets.all(10.0),
    child:
            new RaisedButton(
                onPressed: (){
                  Navigator.push(context, 
                  new MaterialPageRoute(builder: (context){return new HighScores();})
                  );
                },
                child: new Text("High Scores", style: new TextStyle(
    color: Colors.redAccent)),
            )),
            new Container(
                padding: EdgeInsets.all(30.0),
                child:
            new RaisedButton(
                onPressed: ()=> exit(0),
                child: new Text("Exit", style: new TextStyle(
    color: Colors.redAccent))
            ))
          ],
        ),
       )])
    );
  }

  ss(){

  }

}
