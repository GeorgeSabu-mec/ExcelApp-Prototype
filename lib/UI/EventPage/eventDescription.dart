import 'package:flutter/material.dart';

Widget getEventDetails(var eventDetails, var _minpadding) {
  return Hero(
    tag: 'EventDescription',
    child: Padding(
        padding: EdgeInsets.only(left: _minpadding * 8, top: _minpadding * 3),
        child: Column(
          children: <Widget>[
            Row(
              //Event Time Details
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  size: 15.0,
                  color: Colors.white,
                ),
                Container(padding: EdgeInsets.only(right: _minpadding * 2)),
                eventDescriptionText(eventDetails['Time'])
              ],
            ),
            Container(padding: EdgeInsets.only(top: _minpadding * 2)),

            //Event Venue Details
            Row(
              children: <Widget>[
                Icon(
                  Icons.add_location,
                  size: 15.0,
                  color: Colors.white,
                ),
                Container(padding: EdgeInsets.only(right: _minpadding * 2)),
                eventDescriptionText(eventDetails['Venue'])
              ],
            ),
            Container(padding: EdgeInsets.only(top: _minpadding * 2)),

            //EventContacts
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  size: 15.0,
                  color: Colors.white,
                ),
                Padding(padding: EdgeInsets.only(right: _minpadding * 2)),
                eventDescriptionText(eventDetails['Contact'])
              ],
            ),
            Container(padding: EdgeInsets.only(top: _minpadding * 2)),

            //Event Fee Details
            Row(
              children: <Widget>[
                Icon(
                  Icons.label,
                  size: 15.0,
                  color: Colors.white,
                ),
                Container(padding: EdgeInsets.only(right: _minpadding * 2)),
                eventDescriptionText(eventDetails['Fee'])
              ],
            ),
          ],
        )),
  );
}

//Event Description's text styling 
Widget eventDescriptionText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      decoration: TextDecoration.none,
      fontFamily: 'Quicksand-Light',
      fontWeight: FontWeight.w300,
    ),
  );
}

