import 'package:flutter/material.dart';
import 'package:sea_buttle_flutter/widgets/set_ships.dart';

class GameConfiguration extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new GameConfigurationState();
  }
}

class GameConfigurationState extends State<GameConfiguration>{

  bool _isChecked = false;
  int _timeOnMove = 60;


  void onCheckBoxChanged(bool value){
    setState(() {
      _isChecked = value;
    });

  }

  void texFieldChanged(String value){
    if (value != "")
      _timeOnMove = int.parse(value);
  }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Game options"),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
                padding: EdgeInsets.fromLTRB(30.0, 80.0, 100.0, 0.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    new Text("Time on move"),
                    new Expanded(
                        child: new TextField(
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                          onChanged: (String s){
                              int k = 10;
                              if (s != "")
                                var k = int.parse(s);
                              },
                        ))
                  ],)
            ),
            new Container(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 100.0, 0.0),
                child: new Row(
                  children: <Widget>[
                    new Text("Generate randomly?"),
                    new Checkbox(value: _isChecked, onChanged: onCheckBoxChanged,)
                  ],)
            ),
            new Row(
              children: <Widget>[

              ],
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context){return new SetShips();}));
          },
          tooltip: 'Next',
          child: new Icon(Icons.navigate_next),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }


}