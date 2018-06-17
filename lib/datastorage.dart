// this is naive implementation of high scores board
import 'package:sea_buttle_flutter/ship_button.dart';

class DataStorage {

  static var _k = [['1', 'Test1', '1000']
  ,['2', 'Test2', '900']
  ,['3', 'Test3', '800']
  ];

  List getListOfScoreboard(){
    return _k;
  }

  static resetStates(){
    myShips = null;
    enemyShips.forEach((f){
      f.forEach((val){
        val = 0;
      });
    });
  }

  static List<List<int>> myShips;

  // 0  - not attacked
  // 1 - attacked and missed
  // 2 - ship on this place
  static List<List<int>> enemyShips = [
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

  static List<ShipButton> getMyShipsButtons(){
    List<ShipButton> result = new List<ShipButton>();
    for (int i = 0; i < 10; i++)
      for (int j = 0; j < 10; j++){
        ShipButton b = new ShipButton.withState(i, j, myShips[i][j]);
        result.add(b);
      }
    return  result;
  }

  static List<ShipButton> getEnemyShipsButtons(){
    List<ShipButton> result = new List<ShipButton>();
    for (int i = 0; i < 10; i++)
      for (int j = 0; j < 10; j++){
        ShipButton b = new ShipButton.withState(i, j, enemyShips[i][j]);
        result.add(b);
      }
    return  result;
  }

}