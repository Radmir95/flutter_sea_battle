import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class FancyButton extends StatelessWidget{

  FancyButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(onPressed: onPressed,
        fillColor: Colors.blueAccent,
        splashColor: Colors.orange,
        shape: const StadiumBorder(),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Text("Next screen", style: TextStyle(color: Colors.white),)),
          const Icon(
              Icons.arrow_forward,
              color: Colors.amber
          ),
        ]
    )
    );

  }
}