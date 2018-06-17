import 'package:flutter/material.dart';
import 'package:sea_buttle_flutter/datastorage.dart';
import 'package:sea_buttle_flutter/ship_button.dart';
import 'package:sea_buttle_flutter/service_call_helper.dart';
import 'package:sea_buttle_flutter/widgets/ship_to_attack.dart';
import 'package:http/src/response.dart';

class SetShips extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _SetShipsState();
  }
}

class _SetShipsState extends State<SetShips> {
  List<ShipButton> shipsList;
  var player1;
  var player2;
  var activePlayer = 1;

  bool _load = false;

  int Odnopalubnik = 1;
  int Dvuhpalubnik = 2;
  int Trehpalubnik = 3;
  int Chetirehpalubnik = 4;

  int Count1 = 4;
  int Count2 = 3;
  int Count3 = 2;
  int Count4 = 1;

  int tempCount1 = 1;
  int tempCount2 = 2;
  int tempCount3 = 3;
  int tempCount4 = 4;

  String uid;

  // 10x10 field
  List<List<int>> playerShips = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  String shipsToString(){
    String ships = '';
    for(int i = 0; i < 10; i++)
      for (int j = 0; j < 10; j++)
        if (playerShips[i][j].toString() == "2")
          ships += "1";
        else
          ships += "0";
    return ships;
  }

  @override
  void initState() {
    super.initState();
    shipsList = doInit();
  }

  bool isGameRulesValid() {
    tempCount1 = 1;
    tempCount2 = 2;
    tempCount3 = 3;
    tempCount4 = 4;

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (playerShips[i][j] == 2) playerShips[i][j] = 1;
      }
    }

    var count = 0;
    for (var i = 0; i < 10; i++) {
      for (var j = 0; j < 10; j++) {
        if (playerShips[i][j] == 1) {
          playerShips[i][j] = 2;
          count = 1;
          var isValid = isFirstValid(i, j);
          if (!isValid) return false;

          var tempX = i;
          var tempY = j;

          var proceedForward = true;

          while (proceedForward) {
            proceedForward = false;

            if (isValidCell(tempX, tempY) &&
                tempX != 9 &&
                playerShips[tempX + 1][tempY] == 1) {
              count += 1;
              tempX += 1;
              proceedForward = true;
              playerShips[tempX][tempY] = 2;
            } else if (isValidCell(tempX, tempY) &&
                tempY != 9 &&
                playerShips[tempX][tempY + 1] == 1) {
              count += 1;
              tempY += 1;
              proceedForward = true;
              playerShips[tempX][tempY] = 2;
            }

            if (!proceedForward) {
              if (!isValidCount(count)) return false;
            }
          }
        }
      }
    }
    return true;
  }

  bool isFirstValid(int i, int j) {
    try {
      if (playerShips[i - 1][j] == 2) return false;
    } catch (ex) {}

    try {
      if (playerShips[i][j - 1] == 2) return false;
    } catch (ex) {}

    try {
      if (playerShips[i + 1][j] == 2) return false;
    } catch (ex) {}

    try {
      if (playerShips[i][j + 1] == 2) return false;
    } catch (ex) {}

    return true;
  }

  bool isValidCell(int i, int j) {
    try {
      if (playerShips[i + 1][j] == 1 && playerShips[i][j + 1] == 1) return false;
    } catch (ex) {}
    return true;
  }

  bool isValidCount(int count) {
    if (count == Chetirehpalubnik && tempCount1 != 0) {
      tempCount1 -= 1;
      return true;
    }
    if (count == Trehpalubnik && tempCount2 != 0) {
      tempCount2 -= 1;
      return true;
    }
    if (count == Dvuhpalubnik && tempCount3 != 0) {
      tempCount3 -= 1;
      return true;
    }
    if (count == Odnopalubnik && tempCount4 != 0) {
      tempCount4 -= 1;
      return true;
    }
    return false;
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

  void checkShip(ShipButton btn) {
    setState(() {
      if (btn.isShip == true) {
        btn.isShip = false;
        btn.image = new Image.asset("resources/images/water.jpg");
        playerShips[btn.xAxis][btn.yAxis] = 0;
      } else {
        btn.isShip = true;
        btn.image = new Image.asset("resources/images/sheep.jpg");
        playerShips[btn.xAxis][btn.yAxis] = 1;
      }
    });
  }

  checkGame() async {
    bool isDone = false;

    if (isGameRulesValid() &&
        tempCount1 == 0 &&
        tempCount2 == 0 &&
        tempCount3 == 0 &&
        tempCount4 == 0) {
      setState(() {
        _load = true;
      });

      await Helper.addNewPlayer();

      while (!isDone) {
        Response r = await Helper.isReadyForTheGame();
        var body = r.body;

          if (body.contains("true")) {
            setState(() {
              _load = false;
              isDone = true;
            });
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                // add set ships web service call
                Helper.setPlayerShips(shipsToString());

                DataStorage.resetStates();
                DataStorage.myShips = playerShips;

                // return new widget
                return new ShipToAttack();
              }));
          }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load
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
        bottomNavigationBar: new BottomAppBar(
          child: new RaisedButton(
            onPressed: checkGame,
            child: new Text("Ready!"),
          ),
        ),
        appBar: new AppBar(
          title: new Text("Set ships"),
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
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0),
            padding: EdgeInsets.all(5.0),
            itemCount: shipsList.length,
            itemBuilder: (context, i) => new SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: new IconButton(
                      padding: const EdgeInsets.all(3.0),
                      onPressed: () => checkShip(shipsList[i]),
                      icon: shipsList[i].image),
                ),
          ),
          new Align(
            child: loadingIndicator,
            alignment: FractionalOffset.center,
          ),
        ]),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back',
          child: new Icon(Icons.arrow_back_ios),
        ));
  }
}
