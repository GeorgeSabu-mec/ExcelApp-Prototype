import 'package:excelapp_prototype/UI/EventPage/eventDescription.dart';
import 'package:flutter/material.dart';
import 'moreDetailsPage.dart';
import 'backgroundImage.dart';

//Dictionary contains details of the event
var eventDetails = {
  'ImageDir': './assets/kryptos.png',
  'Name': 'Kryptos',
  'Time': '12th November 2019 | 12pm -2pm',
  'Venue': 'Room No.301-304',
  'Contact': '+91 90642658845',
  'Fee': '₹100',
  'About':
      'Excel 2019 presents Treasure Hunt , a union of mutiple diverse rounds designed to test the skills of contestants. Be it a quest around Kochi, make campus or perhaps even around Kochi, make sure you are prepared! Get ready to accomplishdifferent tasks to be declared the winner. Spread over two days , the event is guarenteed to push you to your limts',
  'Format': 'This is the format of the event',
  'Rules': 'This is the rules of the event',
  'Contacts': 'This is the contact details of the event',
  'isLiked': 'false'
};



class EventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventPageState();
  }
}

//Event Details
class EventPageState extends State<EventPage> {

  //All paddings made as multiples of _minpadding
final _minpadding = 5.0;

//Fonts Used
String fontBold='Quicksand-Bold';
String fontLight='Quicksand-Light';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      //Background Image
      getBackgroundImage(eventDetails, [
        Color.fromRGBO(0, 0, 0, 0),
        Color.fromRGBO(23, 18, 41, .8),
        Color.fromRGBO(0, 0, 0, .8)
      ]),
      Container(
          child: ListView(
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(left: _minpadding, top: _minpadding * 61),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: new Icon(Icons.arrow_back),
                    iconSize: 40.0,
                    color: Colors.white,
                    onPressed: () {
                      debugPrint("BackButtonPressed");
                      Navigator.maybePop(context);
                    },
                  ),

                  //Event Name Details
                  Hero(
                    tag: 'EventName',
                    child: Text(eventDetails['Name'],
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: fontBold,
                            height: 1.0,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),
                  Container(padding: EdgeInsets.only(left: _minpadding * 24)),
                  Hero(
                    tag: 'LikeButton',
                    child: likeButton(eventDetails['isLiked']),
                  ),
                ],
              )),

          //Event Details
          getEventDetails(eventDetails, _minpadding),
          Container(
              padding: EdgeInsets.only(top: _minpadding * 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  //Bottom buttons
                  ButtonTheme(
                    minWidth: _minpadding * 36,
                    height: _minpadding * 8,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.white)),
                      color: Color.fromRGBO(21, 18, 41, 1),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(_minpadding * 2),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreDetails()),
                        );
                      },
                      child: Text(
                        "More Details",
                        style: TextStyle(
                          fontFamily: 'Quicksand-light',
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: _minpadding * 36,
                    height: _minpadding * 8,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.white)),
                      color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(_minpadding * 2),
                      onPressed: () {},
                      child: Text(
                        "Book Tickets",
                        style: TextStyle(
                          fontFamily: 'Quicksand-light',
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Container(margin: EdgeInsets.only(top: _minpadding * 50)),

          //Invisible card to utilise hero widget and animate it when more details is clicked
          Hero(
              tag: 'Card',
              child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Container(
                    height: 0,
                  )))
        ],
      ))
    ]));
  }

//Like button functionality
  Widget likeButton(String isLiked) {
    bool likeState = isLiked == 'true';
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: 2)),
        child: IconButton(
            iconSize: 32,
            color: Colors.white,
            icon: !likeState
                ? Icon(Icons.favorite_border)
                : Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              //Insert function that enables this event as favourite
              /*

                        Over Here

                    */
              setState(() {
                likeState = !likeState;
                eventDetails['isLiked'] = '$likeState';
              });
            }));
  }
}
