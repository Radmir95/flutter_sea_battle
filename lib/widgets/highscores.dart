import 'package:flutter/material.dart';
import 'package:sea_buttle_flutter/datastorage.dart';

class HighScores extends StatelessWidget {

  var s = <Widget>[];

  @override
  Widget build(BuildContext context) {
  DataStorage ds = new DataStorage();

  List<Widget> list = new List<Widget>();

  var s = ds.getListOfScoreboard();

  s.forEach((val){
    Text text = new Text(val[0] + " " + val[1] + " " + val[2]);
    list.add(text);
  });

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Highscores"),
      ),
      body:
      new Stack(
        children: <Widget>[

          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("resources/images/high.jpg"), fit: BoxFit.cover,),
            ),
          ),
new Container(
    padding: EdgeInsets.fromLTRB(160.0, 40.0, 0.0, 0.0),
    child:  new Text("Best Players:", textScaleFactor: 1.5,style: new TextStyle(
      color: Colors.redAccent,
      decoration: TextDecoration.underline,
      decorationColor: Colors.red,
      decorationStyle: TextDecorationStyle.solid,
    ),))
          ,
      new Center(
        child: new Container(
            padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list
        )
        ))])
     ,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back',
        child: new Icon(Icons.arrow_back_ios),
      ),
    );

  }

}

