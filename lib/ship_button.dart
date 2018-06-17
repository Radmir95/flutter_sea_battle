import 'package:flutter/material.dart';

class ShipButton{
  int xAxis;
  int yAxis;
  int state = 0;
  Image image;
  bool isShip;

  ShipButton(int xAxis, int yAxis){
    this.xAxis = xAxis;
    this.yAxis = yAxis;
    this.image = Image.asset("resources/images/water.jpg");
    this.isShip = false;
  }

  ShipButton.withState(int xAxis, int yAxis, int state){
    this.xAxis = xAxis;
    this.yAxis = yAxis;
    if (state == 0)
      this.image = Image.asset("resources/images/water.jpg");
    else
      this.image = Image.asset("resources/images/sheep.jpg");
    this.isShip = false;
  }

}