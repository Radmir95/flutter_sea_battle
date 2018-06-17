import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

 class Helper {

  static String site = "http://flutterseabuttlesvc.azurewebsites.net/Flutter.asmx";
  static String uid = (new Uuid()).v1();

  static Future<http.Response> addNewPlayer({int seconds = 0}) async {
    String method = "/AddNewPlayer?id=" + uid;
    var service = site + method;
    return new Future.delayed(new Duration(seconds: seconds) ,()=> http.get(service));
  }

  static Future<http.Response> canMakeStep({int seconds = 0}) {
    String method = "/CanMakeStep?userId=" + uid;
    var service = site + method;
    return new Future.delayed(new Duration(seconds: seconds),()=> http.get(service));
  }

  static Future<http.Response> getResult({int seconds = 0}) {
    String method = "/GetResult?userId=" + uid;
    var service = site + method;
    return new Future.delayed(new Duration(seconds: seconds) ,()=> http.get(service));
  }

  static Future<http.Response> isReadyForTheGame({int seconds = 0}) {
    String method = "/IsReadyForTheGame?userID=" + uid;
    var service = site + method;
    return new Future.delayed(new Duration(seconds: seconds) ,()=> http.get(service));
  }

  static Future<http.Response> makeStep(int stepX, int stepY,{int seconds = 0}) {
    String method = "/MakeStep?userId=$uid&stepX=$stepX&stepY=$stepY";
    var service = site + method;
    return new Future.delayed(new Duration(seconds: seconds) ,()=> http.get(service));
  }

  static Future<http.Response> getGameStatus({int seconds = 0}) {
    String method = "/GetGameStatus?userId=$uid";
    var service = site + method;
    return new Future.delayed(new Duration(seconds: seconds) ,()=> http.get(service));
  }

  static Future<http.Response> setPlayerShips(String ships, {int seconds = 0}) {
    String method = "/SetPlayerShips?userId=$uid&shipsToParse=$ships";
    var service = site + method;
    return new Future.delayed(new Duration(seconds: seconds) ,()=> http.get(service));
  }


}