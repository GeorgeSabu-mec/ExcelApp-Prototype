import 'package:flutter/material.dart';

Widget getBackgroundImage(var eventDetails, List<Color> gradient) {
  return Stack(children: <Widget>[

    //Background Image
    Hero(
      tag: 'EventImage',
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(eventDetails['ImageDir']),
              fit: BoxFit.fitHeight),
        ),
      ),
    ),

    //Gradient effect
    Hero(
      tag: 'Gradient',
      child: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient, begin: Alignment.topCenter, end: Alignment.bottomCenter),
      )),
    )
  ]);
}
