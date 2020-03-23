import 'package:excelapp_prototype/UI/EventPage/backgroundImage.dart';
import 'package:excelapp_prototype/UI/EventPage/eventDescription.dart';
import 'package:flutter/material.dart';
import 'eventPage.dart';

class MoreDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoreDetailsState();
  }
}

class MoreDetailsState extends State<MoreDetails> {

  //All paddings made as multiples of _minpadding
  final _minpadding = 5.0;

//Fonts Used
String fontBold='Quicksand-Bold';
String fontLight='Quciksand-Light';

//Stores the current active tab in more details
  String activeTab = 'About';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      // Background Image
      getBackgroundImage(eventDetails, [
        Color.fromRGBO(0, 0, 0, 1),
        Color.fromRGBO(23, 18, 41, .6),
        Color.fromRGBO(0, 0, 0, .6)
      ]),
      Container(
          child: Column(
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(left: _minpadding, top: _minpadding * 28.8),
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(
                          left: _minpadding * 8, top: _minpadding * 5)),

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

                  //Like Button
                  Hero(
                    tag: 'LikeButton',

                    //Code to make the button under a Material widget during animation which otherwise throws error
                    flightShuttleBuilder: (BuildContext flightContext,
                            Animation<double> animation,
                            HeroFlightDirection flightDirection,
                            BuildContext fromHeroContext,
                            BuildContext toHeroContext) =>
                        Material(
                            type: MaterialType.transparency,
                            child: toHeroContext.widget),
                    child: likeButton(eventDetails['isLiked']),
                  ),
                ],
              )),

          //EventDetails
          getEventDetails(eventDetails, _minpadding),

          Container(padding: EdgeInsets.only(top: _minpadding * 5)),

          //More details card
          Expanded(
              child: Hero(
                  tag: 'Card',
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular((45)),
                                  topRight: Radius.circular(45))),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding:
                                      EdgeInsets.only(top: _minpadding * 4)),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[

                                    //Tabs in the More Details section
                                    getTab('About', activeTab),
                                    getTab('Format', activeTab),
                                    getTab('Rules', activeTab),
                                    getTab('Contacts', activeTab),
                                  ]),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: _minpadding * 3,
                                      left: _minpadding * 6,
                                      right: _minpadding * 6,
                                      bottom: _minpadding * 3),
                                  child: Text(
                                    eventDetails[activeTab],
                                    style: TextStyle(
                                      fontFamily: fontLight,
                                      color: Color.fromRGBO(23, 18, 41, 1),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ))
                            ],
                          )))))
        ],
      )),
    ]));
  }

//More details tab styling
  Widget getTab(String tabName, String active) {
    bool isClicked = active == tabName;
    return Padding(
      padding: EdgeInsets.all(_minpadding),
      child: ButtonTheme(
        minWidth: _minpadding * 5,
        height: _minpadding * 8,
        child: FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(17.0),
                side: BorderSide(color: Colors.transparent)),
            color: Colors.transparent,
            padding: EdgeInsets.all(_minpadding * 2),
            onPressed: () {
              setState(() {
                activeTab = tabName;
              });
            },
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: isClicked
                                ? Color.fromRGBO(21, 18, 41, 1)
                                : Colors.transparent))),
                child: getTabText(tabName, isClicked))),
      ),
    );
  }

  //More details tab text styling
  Widget getTabText(String text, bool isClicked) {
    if (isClicked)
      return Text(text,
          style: TextStyle(
              height: 1.0,
              fontSize: 20.0,
              fontFamily: fontBold,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(23, 18, 41, 1)));
    else
      return Text(text,
          style: TextStyle(
              height: 1.0,
              fontSize: 20.0,
              fontFamily: fontLight,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(23, 18, 41, 0.4)));
  }

  //Like Button defenition
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
