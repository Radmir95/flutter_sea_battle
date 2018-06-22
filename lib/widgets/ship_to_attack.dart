import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sea_buttle_flutter/custom_widgets/finish_dialog.dart';
import 'package:sea_buttle_flutter/datastorage.dart';
import 'package:sea_buttle_flutter/ship_button.dart';
import 'package:sea_buttle_flutter/service_call_helper.dart';
import 'package:sea_buttle_flutter/custom_widgets/fancy_button.dart';
import 'package:sea_buttle_flutter/widgets/main.dart';

enum Screens{
  MyShips,
  EnemyShips
}

class ShipToAttack extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return new _ShipToAttackState();
  }
}

List<ShipButton> doInit() {
  var shipButtons = <ShipButton>[
    new ShipButton(0, 0),
    new ShipButton(0, 1),
    new ShipButton(0, 2),
    new ShipButton(0, 3),
    new ShipButton(0, 4),
    new ShipButton(0, 5),
    new ShipButton(0, 6),
    new ShipButton(0, 7),
    new ShipButton(0, 8),
    new ShipButton(0, 9),
    new ShipButton(1, 0),
    new ShipButton(1, 1),
    new ShipButton(1, 2),
    new ShipButton(1, 3),
    new ShipButton(1, 4),
    new ShipButton(1, 5),
    new ShipButton(1, 6),
    new ShipButton(1, 7),
    new ShipButton(1, 8),
    new ShipButton(1, 9),
    new ShipButton(2, 0),
    new ShipButton(2, 1),
    new ShipButton(2, 2),
    new ShipButton(2, 3),
    new ShipButton(2, 4),
    new ShipButton(2, 5),
    new ShipButton(2, 6),
    new ShipButton(2, 7),
    new ShipButton(2, 8),
    new ShipButton(2, 9),
    new ShipButton(3, 0),
    new ShipButton(3, 1),
    new ShipButton(3, 2),
    new ShipButton(3, 3),
    new ShipButton(3, 4),
    new ShipButton(3, 5),
    new ShipButton(3, 6),
    new ShipButton(3, 7),
    new ShipButton(3, 8),
    new ShipButton(3, 9),
    new ShipButton(4, 0),
    new ShipButton(4, 1),
    new ShipButton(4, 2),
    new ShipButton(4, 3),
    new ShipButton(4, 4),
    new ShipButton(4, 5),
    new ShipButton(4, 6),
    new ShipButton(4, 7),
    new ShipButton(4, 8),
    new ShipButton(4, 9),
    new ShipButton(5, 0),
    new ShipButton(5, 1),
    new ShipButton(5, 2),
    new ShipButton(5, 3),
    new ShipButton(5, 4),
    new ShipButton(5, 5),
    new ShipButton(5, 6),
    new ShipButton(5, 7),
    new ShipButton(5, 8),
    new ShipButton(5, 9),
    new ShipButton(6, 0),
    new ShipButton(6, 1),
    new ShipButton(6, 2),
    new ShipButton(6, 3),
    new ShipButton(6, 4),
    new ShipButton(6, 5),
    new ShipButton(6, 6),
    new ShipButton(6, 7),
    new ShipButton(6, 8),
    new ShipButton(6, 9),
    new ShipButton(7, 0),
    new ShipButton(7, 1),
    new ShipButton(7, 2),
    new ShipButton(7, 3),
    new ShipButton(7, 4),
    new ShipButton(7, 5),
    new ShipButton(7, 6),
    new ShipButton(7, 7),
    new ShipButton(7, 8),
    new ShipButton(7, 9),
    new ShipButton(8, 0),
    new ShipButton(8, 1),
    new ShipButton(8, 2),
    new ShipButton(8, 3),
    new ShipButton(8, 4),
    new ShipButton(8, 5),
    new ShipButton(8, 6),
    new ShipButton(8, 7),
    new ShipButton(8, 8),
    new ShipButton(8, 9),
    new ShipButton(9, 0),
    new ShipButton(9, 1),
    new ShipButton(9, 2),
    new ShipButton(9, 3),
    new ShipButton(9, 4),
    new ShipButton(9, 5),
    new ShipButton(9, 6),
    new ShipButton(9, 7),
    new ShipButton(9, 8),
    new ShipButton(9, 9)
  ];
  return shipButtons;
}

class _ShipToAttackState extends State<ShipToAttack> {

  String currentHeaderText = "Time To Attack Enemy Ships";
  String currentSwipeButtonText = "My Ships";

  List<ShipButton> shipsList;
  Screens currentScreen = Screens.EnemyShips;
  bool _load = false;

  @override
  void initState() {
    super.initState();
    shipsList = doInit();
  }

  Future<bool> canMakeStep() async {
    var response = await Helper.canMakeStep();
    var body = response.body;
    if (body.contains("true"))
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load
        // is ready for the game - creates game, so we need to invoke this webservice firstly
        ? new Container(
            color: Colors.grey[300],
            width: 70.0,
            height: 70.0,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(child: new CircularProgressIndicator())),
          )
        : new Container();

    return new Scaffold(
      appBar: new AppBar(
        title: Text(currentHeaderText),
      ),
      body: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("resources/images/mainback.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              childAspectRatio: 1.0,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 3.0),
          padding: EdgeInsets.all(5.0),
          itemCount: shipsList.length,
          itemBuilder: (context, i) => new SizedBox(
                width: 50.0,
                height: 50.0,
                child: new IconButton(
                    padding: const EdgeInsets.all(2.0),
                    onPressed: () => attackShip(shipsList[i]),
                    icon: shipsList[i].image),
              ),
        ),
        new Align(
          child: loadingIndicator,
          alignment: FractionalOffset.center,
        ),
      ]),
      floatingActionButton: FancyButton(onPressed: swipeToNextScreen,),
    );
  }

  void swipeToNextScreen(){
    // some logic to update ships on screen
    setState(() {
      if (currentScreen == Screens.EnemyShips){
        currentScreen = Screens.MyShips;
        // set to myShips
        setState(() {
          shipsList = DataStorage.getMyShipsButtons();
        });
      }
      else
        {
          currentScreen = Screens.EnemyShips;
          shipsList = DataStorage.getEnemyShipsButtons();
        }
    });

  }

  void attackShip(ShipButton ship) async {
    var result = await canMakeStep();
    if (result == true) {
      setState(() {
        _load = result;
      });
    } else {
      setState(() {
        currentHeaderText = "Time to Enemy Turn";
        _load = true;
      });
      var result = await canMakeStep();
      while (result != true) {
        result = await canMakeStep();
      }
    }
    // attack ship - call web service
    setState(() {
      currentHeaderText = "Time To Attack Enemy Ships";
      ship.isShip = true;
    });

    var response = await Helper.makeStep(ship.yAxis, ship.xAxis);
    DataStorage.enemyShips[ship.xAxis][ship.yAxis] = 1;
    var body = response.body;
    var isGoodStep = body.contains("true");
    setState(() {
      if (isGoodStep)
        ship.image = new Image.asset("resources/images/sheep_sink.png");
      else
        ship.image = new Image.asset("resources/images/x.jpg");
      _load = false;
    });

    response = await Helper.getGameStatus();
    body = response.body;

    if (body.contains('true')){
      showDialog(
          context: context,
          builder: (_) => new FinishDialog("You win!", "Click 'Ok' to return on main page", newGame));
    }
    else if (body.contains('false')){
      showDialog(
          context: context,
          builder: (_) => new FinishDialog("You lose!.", "Click 'Ok' to return on main page", newGame));
    }
  }

  void newGame(){
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return MyApp();
    }));
  }

}
